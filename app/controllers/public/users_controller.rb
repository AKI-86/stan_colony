class Public::UsersController < ApplicationController
  before_action :reject_guest_user, only: [:show, :mypage, :edit, :withdraw, :unsubscribe]
  before_action :authenticate_user!, only: [:show, :mypage, :edit, :withdraw, :unsubscribe]

  def mypage
    @user = current_user
    @favorite = @user.favorites.map(&:artist)  # これは
    @favorite_artists = Artist.joins(:favorites).where(favorites: { user_id: @user.id }).page(params[:page]).per(10)
    @artists = @user.artists.page(params[:page]).per(10)
    @groups = @user.owned_groups.page(params[:page]).per(10)
    @following_users = @user.followings.page(params[:following_page]).per(10)
    @follower_users = @user.followers.page(params[:follower_page]).per(10)
    @joined_groups = @user.joined_groups.order(created_at: :desc).page(params[:page]).per(10)
  end

  def index
    @users = User.without_guests.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to users_mypage_path, alert: "他のユーザーの情報は編集できません。"
    end
  end

  def show
    @user =User.find(params[:id])
    @artists = @user.artists.page(params[:page]).per(10)
    @favorite = @user.favorites.map(&:artist)  # これは
    @favorite_artists = Artist.joins(:favorites).where(favorites: { user_id: @user.id }).page(params[:page]).per(10)
    @groups = @user.owned_groups.page(params[:page]).per(10)
    if @user == current_user && params[:skip_redirect].blank?
      redirect_to users_mypage_path and return
    end
    @following_users = @user.followings.page(params[:following_page]).per(10)
    @follower_users = @user.followers.page(params[:follower_page]).per(10)
    @joined_groups = @user.joined_groups.order(created_at: :desc).page(params[:page]).per(10)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_mypage_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def follows
  end

  def followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :gender, :age, :image)
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_back fallback_location: root_path, alert: "ゲストユーザーはこのページにアクセスできません。"
    end
  end
end
