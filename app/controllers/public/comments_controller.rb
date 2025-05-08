class Public::CommentsController < ApplicationController
  before_action :set_artist
  
  def create
    topic = @artist.topics.find(params[:topic_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.topic = topic #取得したcommentが所属するtopicを参照している。これは削除後のリダイレクト先に必要
    comment.save
    redirect_to artist_topic_path(@artist, topic)
  end

  def destroy
    comment = Comment.find(params[:id])
    topic = comment.topic #取得したcommentが所属するtopicを参照している。これは削除後のリダイレクト先に必要
    comment.destroy
    redirect_to artist_topic_path(@artist, topic)
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])  # artist_idを使って、@artistを設定
  end

  def comment_params
    params.require(:comment).permit(:body)
 end
end
