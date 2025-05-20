class Admin::GroupsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :authenticate_admin! 
  
  def index
    @groups = Group.includes(:members).page(params[:page]).per(10)
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
    @group_comment = GroupComment.new
    @group_comments = @group.group_comments.includes(:user).order(created_at: :desc).page(params[:page]).per(10)
    @members = @group.members
  end

  def create
  end

  def edit
    @group = Group.find(params[:id])
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
      redirect_to admin_group_path(@group)
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :image, :introduction, :is_active)
  end
end
