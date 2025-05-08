class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
  end

  def index
  end

  def edit
  end

  def show
    @user =User.find(params[:id])
    @artists = @user.artists
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  def follows
  end

  def followers
  end
end
