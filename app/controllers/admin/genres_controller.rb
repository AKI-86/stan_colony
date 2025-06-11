class Admin::GenresController < ApplicationController
  def index
    @topic_genres = TopicGenre.page(params[:page]).per(10)
    @topic_genre = TopicGenre.new
  end

  def create
    @topic_genre = TopicGenre.new(topic_genre_params)
    if @topic_genre.save
      redirect_to admin_genres_path, notice: 'ジャンルを追加しました。'
    else
      @topic_genres = TopicGenre.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
    @topic_genre = TopicGenre.find(params[:id])
  end

  def update
    @topic_genre = TopicGenre.find(params[:id])
    if @topic_genre.update(topic_genre_params)
      redirect_to admin_genres_path, notice: 'ジャンルを更新しました。'
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  private

  def topic_genre_params
    params.require(:topic_genre).permit(:name)
  end
end
