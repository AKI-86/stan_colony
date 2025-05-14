class Public::FavoritesController < ApplicationController
  def create
    artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.new(artist_id: artist.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    artist = Artist.find(params[:artist_id])
    favorite = current_user.favorites.find_by(artist_id: artist.id)
    favorite.destroy if favorite
    redirect_to request.referer
  end
end
