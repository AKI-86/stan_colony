class Admin::CommentsController < ApplicationController
    before_action :set_artist
    
    def create
      topic = @artist.topics.find(params[:topic_id])
      @comment = Comment.new(comment_params)
      if current_admin
        @comment.admin_id = current_admin.id # 管理者IDを関連付けるカラムがあれば
      else
        @comment.user_id = current_user.id
      end
      @comment.topic = topic
    
      if @comment.save
        redirect_to artist_topic_path(@artist, topic)
      else
        @topic = topic
        @artist = @topic.artist
        @comments = @topic.comments.page(params[:page]).per(10)
        flash.now[:alert] = "空欄のコメントは投稿できません"
        render 'public/topics/show'
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @topic = @comment.topic  # コメントに関連するトピックを取得
      @artist = @topic.artist  # トピックに関連するアーティストを取得
      @comment.soft_delete
      flash[:notice] = "コメントは管理人により削除されました"
      redirect_to artist_topic_path(@artist, @topic)
    end
  
    private
  
    def set_artist
      @artist = Artist.find(params[:artist_id])  # artist_idを使って、@artistを設定
    end
  
    def comment_params
      params.require(:comment).permit(:body)
   end
  end