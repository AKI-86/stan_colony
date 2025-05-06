class Public::CommentsController < ApplicationController
  before_action :set_artist
  
  def create
    topic = @artist.topics.find(params[:topic_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.topic = topic
    comment.save
    redirect_to artist_topic_path(@artist, topic)
  end

  def destroy
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])  # artist_idを使って、@artistを設定します
  end

  def comment_params
    params.require(:comment).permit(:body)
 end
end
