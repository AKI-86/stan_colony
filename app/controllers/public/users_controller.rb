class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @favorite = @user.favorites.map(&:artist)  # ← これを追加
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user =User.find(params[:id])
    @artists = @user.artists
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
  end

  def follows
  end

  def followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :email, :gender, :age, :image)
  end
end
