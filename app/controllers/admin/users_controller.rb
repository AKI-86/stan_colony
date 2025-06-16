class Admin::UsersController < ApplicationController
  before_action :authenticate_admin! 

  def index
    @user_count = User.where(guest: [false, nil]).count
    @guest_user_count = User.where(guest: true).count
    @users = User.without_guests.includes(:artists, :topics, :owned_groups, :comments).order(created_at: :desc).page(params[:normal_page]).per(10)
    @guest_users = User.where(guest: true).includes(:artists, :topics, :owned_groups, :comments).order(created_at: :desc).page(params[:guest_page]).per(10)
    respond_to do |format|
      format.html
      format.js   # index.js.erbを返す
    end
  end

  def show
    @user = User.find(params[:id])
    @artists = @user.artists.includes(:topics).limit(100)
    @topics = @user.topics.includes(:artist).order(created_at: :desc).limit(50)
    @comments = Comment.where(user_id: @user.id).limit(100)
    @groups = @user.owned_groups.limit(10)
    @joined_groups = @user.joined_groups.limit(10)
    @artists_count = @user.artists.count
    @topics_count = @user.topics.count
    @comments_count = Comment.where(user_id: @user.id).count
    @groups_count = @user.owned_groups.count
    @joined_groups_count = @user.joined_groups.count
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
