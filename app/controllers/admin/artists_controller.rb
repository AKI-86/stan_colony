class Admin::ArtistsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @artists = Artist.includes(:favorites, topics: :comments).order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
    @artist = Artist.find(params[:id])
    @topics = @artist.topics.includes(:user, :comments).order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @artist = Artist.find(params[:id])
    @tag_names = @artist.artist_tags.pluck(:name).join(', ')
  end

  def update
    @artist = Artist.find(params[:id])
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?).uniq

    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :edit and return
    end
    invalid_tags = tag_names.select { |name| name.length > 20 }
    if invalid_tags.any?
      flash.now[:alert] = "タグは1文字以上20文字以内で入力してください。"
      render :new and return
    end

    if @artist.update(artist_params)
      @artist.a_tags.destroy_all
      tag_names.each do |tag_name|
        tag = ArtistTag.find_or_create_by(name: tag_name)
        ATag.create(artist: @artist, artist_tag: tag)
      end
      redirect_to admin_artist_path(@artist), notice: "アーティスト情報を更新しました。"
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :image, :introduction, :is_active)
  end
end
