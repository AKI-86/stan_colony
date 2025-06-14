class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :reject_guest_user

  def mypage
    @user = current_user
    @favorite_artists = Artist.joins(:favorites).where(favorites: { user_id: @user.id }).merge(Artist.active).with_attached_image.page(params[:favorite_artists_page]).per(10)
    @artists = @user.artists.active.with_attached_image.page(params[:artists_page]).per(10)
    @groups = @user.owned_groups.active.with_attached_image.page(params[:groups_page]).per(10)
    @following_users = @user.followings.active.with_attached_image.page(params[:following_page]).per(10)
    @follower_users = @user.followers.active.with_attached_image.page(params[:follower_page]).per(10)
    @joined_groups = @user.joined_groups.active.order(created_at: :desc).with_attached_image.page(params[:joined_page]).per(10)
    @recommended_artists = @user.followed_users_favorite_artists_except_mine
  end

  def index
    @users = User.active.without_guests.page(params[:page])
  end

  def edit
    @user = User.active.find(params[:id])
    unless @user == current_user
      redirect_to users_mypage_path, alert: "他のユーザーの情報は編集できません。"
    end
  end

  def show
    @user =User.find(params[:id])
    unless @user && (@user.is_active || admin_signed_in?)
      redirect_to root_path, alert: "そのページは表示できません"
      return
    end
    
    if @user.guest? && !admin_signed_in?
      redirect_to root_path, alert: "そのページは表示できません"
      return
    end

    @artists = @user.artists.active.with_attached_image.page(params[:artists_page]).per(10)
    @favorite = @user.favorites.map(&:artist).select(&:is_active)
    @favorite_artists = Artist.active.joins(:favorites).where(favorites: { user_id: @user.id }).with_attached_image.page(params[:favorite_artists_page]).per(10)
    @groups = @user.owned_groups.active.with_attached_image.page(params[:groups_page]).per(10)
    if @user == current_user && params[:skip_redirect].blank?
      redirect_to users_mypage_path and return
    end
    @following_users = @user.followings.active.with_attached_image.page(params[:following_page]).per(10)
    @follower_users = @user.followers.active.with_attached_image.page(params[:follower_page]).per(10)
    @joined_groups = @user.joined_groups.active.order(created_at: :desc).page(params[:joined_page]).per(10)
  end

  def update
    @user = User.active.find(params[:id])
    if @user.update(user_params)
      redirect_to users_mypage_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.active.find(current_user.id)
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
    params.require(:user).permit(:name, :introduction, :email, :gender, :age, :my_taste,:image)
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_back fallback_location: root_path, alert: "ゲストユーザーはこのページにアクセスできません。"
    end
  end
end
