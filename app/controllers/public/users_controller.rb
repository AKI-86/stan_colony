class Public::UsersController < ApplicationController
  before_action :reject_guest_user, only: [:show, :mypage]

  def mypage
    @user = current_user
    @favorite = @user.favorites.map(&:artist)  # これは
    @artists = @user.artists
  end

  def index
    @users = User.without_guests.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user =User.find(params[:id])
    @artists = @user.artists
    @favorite = @user.favorites.map(&:artist)  # これは
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
