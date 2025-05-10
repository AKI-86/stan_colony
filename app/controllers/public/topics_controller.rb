class Public::TopicsController < ApplicationController
  before_action :set_artist

  def new
    @topic = @artist.topics.new
  end

  def show
    @topic = @artist.topics.find(params[:id])
    @comment = Comment.new
  end

  def create
    @topic = @artist.topics.new(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to artist_path(@artist), notice: "トピックを作成しました。"
    else
      flash.now[:alert] = "トピックの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @topic =Topic.find(params[:id])
  end

  def update
    @topic =Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to artist_topic_path(@artist, @topic)
    else
      render :edit
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :topic_genre_id, :image)
  end
end
