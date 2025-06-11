class Public::CommentsController < ApplicationController
  before_action :set_artist
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @topic = @artist.topics.find(params[:topic_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic = @topic #取得したcommentが所属するtopicを参照している。これは削除後のリダイレクト先に必要

    respond_to do |format|
      if @comment.save
        @comments = @topic.comments.order(created_at: :desc).page(params[:page]).per(10)
        format.js   # 成功時は create.js.erb を返す
      else
        @comments = @topic.comments.order(created_at: :desc).page(params[:page]).per(10)
        format.js   # エラーも create.js.erb 側で表示処理を行う
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @topic = @comment.topic  # コメントに関連するトピックを取得
    @artist = @topic.artist  # トピックに関連するアーティストを取得
    @comment.soft_delete
    if admin_signed_in?
      redirect_to admin_artist_topic_path(@artist, @topic), notice: "コメントを削除しました。"
    else
      redirect_to artist_topic_path(@artist, @topic), notice: "コメントを削除しました。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_artist
    @artist = Artist.active.find_by(id: params[:artist_id])
    unless @artist
      redirect_to root_path, alert: "そのページは表示できません"
    end
  end

end
