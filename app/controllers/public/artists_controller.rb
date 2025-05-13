class Public::ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @topics = @artist.topics.order(created_at: :desc).page(params[:page]).per(10)
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
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artists_path(@artist.id)
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image, :introduction)
  end
end
