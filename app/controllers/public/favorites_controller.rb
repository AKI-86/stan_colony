class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :reject_guest_user, only: [:create, :destroy]

  def create
    @artist = Artist.active.find(params[:artist_id])
    favorite = current_user.favorites.new(artist_id: @artist.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @artist = Artist.active.find(params[:artist_id])
    favorite = current_user.favorites.find_by(artist_id: @artist.id)
    favorite.destroy if favorite
    # redirect_to request.referer
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_back fallback_location: root_path, alert: "ゲストユーザーはこの操作ができません。"
    end
  end
end
