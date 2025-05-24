class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin! 
  before_action :set_artist

  def show
    @topic = @artist.topics.find(params[:id])
    @comment = Comment.new
    @comments = @topic.comments.order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @topic =Topic.find(params[:id])
  end

  def update
    @topic =Topic.find(params[:id])
    @artist = @topic.artist
    if @topic.update(topic_params)
      redirect_to admin_artist_path(@artist), notice: "アーティスト情報を更新しました。"
    else
      render :edit
    end
  end

  private
  
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :topic_genre_id, :image, :is_active)
  end
end
