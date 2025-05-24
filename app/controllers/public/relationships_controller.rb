class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :reject_guest_user

  def create
    user = User.active.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.active.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to  request.referer
  end

  private

  def reject_guest_user
    if current_user&.guest?
      redirect_back fallback_location: root_path, alert: 'ゲストユーザーはフォロー操作ができません。'
    end
  end
end
