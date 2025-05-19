class Public::GroupsController < ApplicationController
  before_action :reject_guest_user, only: [:new, :create]

  def new
    @group = Group.new
  end

  def index
    @groups = Group.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    @group = Group.find(params[:id])
    @group_comment = GroupComment.new
    @group_comments = @group.group_comments.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    @members = @group.members
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?)
    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :new and return
    end

    if @group.save
      tag_names.each do |tag_name|
        tag = GroupTag.find_or_create_by(name: tag_name)
        GTag.create(group: @group, group_tag: tag)
      end
      redirect_to group_path(@group), notice: "サークルを作成しました。"
    else
      flash.now[:alert] = "サークルの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    unless @group.owner == current_user
      redirect_to group_path(@group), alert: "他のユーザーの作成したサークルは編集できません。"
    end
  end

  def update
    @group = Group.find(params[:id])
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?).uniq

    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :edit and return
    end
    if @group.update(group_params)
      # 古いタグの関連付けを削除
      @group.g_tags.destroy_all
      # 新しいタグを再登録
      tag_names.each do |tag_name|
        tag = GroupTag.find_or_create_by(name: tag_name)
        if tag.persisted?
          GTag.create(group: @group, group_tag: tag)
        end
      end
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :image, :introduction)
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_to groups_path, alert: 'ゲストユーザーはサークルを作成できません。'
    end
  end

  def update_tags(group)
    # タグ名をカンマ区切りで受け取り、前後空白を除去して配列化
    tag_names = params[:tag_names].to_s.split(",").map(&:strip).reject(&:blank?)
    # 既存タグを取得or新規作成しIDリストに変換
    tag_ids = tag_names.map do |name|
      GroupTag.find_or_create_by(name: name).id
    end
    # 中間テーブルを更新
    group.group_tag_ids = tag_ids
  end
end