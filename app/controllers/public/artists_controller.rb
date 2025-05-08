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
    if @artist.save
      redirect_to artists_path(@artist), notice: "トピックを作成しました。"
    else
      flash.now[:alert] = "トピックの作成に失敗しました。"
      render :new
    end
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
