class Public::ArtistsController < ApplicationController
  before_action :reject_guest_user, only: [:new, :create]

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
      redirect_to artist_path(@artist), notice: "アーティストを作成しました。"
    else
      flash.now[:alert] = "アーティストの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    unless @artist.user == current_user
      redirect_to artist_path(@artist), alert: "他のユーザーの作成したアーティストは編集できません。"
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image, :introduction)
  end

  def reject_guest_user
    if current_user.guest?
      redirect_to artists_path, alert: 'ゲストユーザーはアーティストページを作成できません。'
    end
  end
end

