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
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to group_path(@group), notice: "サークルを作成しました。"
    else
      flash.now[:alert] = "サークルの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
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