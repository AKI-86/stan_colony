class Public::GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :reject_guest_user, only: [:new, :create, :edit, :update]

  def new
    @group = Group.new
  end

  def index
    @active_groups = Group.active.order(created_at: :desc).limit(8)
    # @groups = Group.active.left_joins(:group_comments).group('groups.id').order(Arel.sql('MAX(group_comments.created_at) DESC NULLS LAST')).page(params[:page]).per(8)
  end

  def show
    @group = Group.find(params[:id])

    unless @group && (@group.is_active || admin_signed_in?)
      redirect_to root_path, alert: "そのページは表示できません"
      return
    end

    @group_comment = GroupComment.new
    @group_comments = @group.group_comments.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    @members = @group.members
  end

  def create
    @group = Group.new(group_params)
    @group = current_user.owned_groups.build(group_params)
    
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?).uniq

    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :new and return
    end

    invalid_tags = tag_names.select { |name| name.length > 20 }
    if invalid_tags.any?
      flash.now[:alert] = "タグは1文字以上20文字以内で入力してください。"
      render :new and return
    end

    if @group.save
      tag_names.each do |tag_name|
        tag = GroupTag.find_or_create_by(name: tag_name)
        GTag.create(group: @group, group_tag: tag)
      end
      GroupMembership.create(user: current_user, group: @group)
      redirect_to group_path(@group), notice: "サークルを作成しました。"
    else
      flash.now[:alert] = "サークルの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @group = Group.active.find(params[:id])
    unless @group.owner == current_user
      redirect_to group_path(@group), alert: "他のユーザーの作成したサークルは編集できません。"
    end
  end

  def update
    @group = Group.active.find(params[:id])
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?).uniq

    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :edit and return
    end

    invalid_tags = tag_names.select { |name| name.length > 20 }
    if invalid_tags.any?
      flash.now[:alert] = "タグは1文字以上20文字以内で入力してください。"
      render :new and return
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
  
end