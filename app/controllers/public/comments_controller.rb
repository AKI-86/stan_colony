class Public::CommentsController < ApplicationController
  before_action :set_artist
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    topic = @artist.topics.find(params[:topic_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic = topic #取得したcommentが所属するtopicを参照している。これは削除後のリダイレクト先に必要

    if @comment.save
      redirect_to artist_topic_path(@artist, topic)
    else
      # エラー時はindexなどのビューに@commentと@commentsを渡してrender
      @topic = topic
      @artist = @topic.artist
      @comments = @topic.comments.page(params[:page]).per(10) # ページネーションも同じように
  
      flash.now[:alert] = "空欄のコメントは投稿できません"
      render 'public/topics/show'  # 例: トピック詳細画面のviewを再表示
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

  def set_artist
    @artist = Artist.active.find(params[:artist_id])  # artist_idを使って、@artistを設定
    unless @artist
      redirect_to root_path, alert: "そのページは表示できません"
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
 end
end
