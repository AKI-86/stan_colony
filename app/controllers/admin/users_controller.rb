class Admin::UsersController < ApplicationController
  before_action :authenticate_admin! 

  def index
    @users = User.without_guests.includes(:artists, :topics, :owned_groups, :comments).order(created_at: :desc).page(params[:normal_page]).per(10)
    @guest_users = User.where(guest: true).includes(:artists, :topics, :owned_groups, :comments).order(created_at: :desc).page(params[:guest_page]).per(10)

  respond_to do |format|
    format.html
    format.js   # index.js.erbを返す
  end
  end

  def show
    @user = User.find(params[:id])
    @artists = @user.artists
    @topics = Topic.joins(:artist).where(artists: { user_id: @user.id })
    @comments = Comment.where(user_id: @user.id)
    @groups = @user.owned_groups
    @joined_groups = @user.joined_groups
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :gender, :age, :image, :is_active, :my_taste)
  end
end
