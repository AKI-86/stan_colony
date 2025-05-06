class Public::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @topics = @artist.topics.all
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user_id = current_user.id
    @artist.save
    redirect_to artists_path
  end

  def edit
  end

  def update
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image, :introduction)
  end
end
