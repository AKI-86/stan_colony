class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin! 

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


  def topic_params
    params.require(:topic).permit(:title, :body, :topic_genre_id, :image, :is_active)
  end
end
