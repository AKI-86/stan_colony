class Public::TopicsController < ApplicationController
  before_action :set_artist
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :reject_guest_user, only: [:new, :create, :edit, :update]


  def new
    @topic = @artist.topics.new
  end

  def show
    @topic = @artist.topics.find(params[:id])
    unless @topic && (@topic.is_active || admin_signed_in?)
      redirect_to root_path, alert: "そのページは表示できません"
      return
    end
    @comment = Comment.new
    @comments = @topic.comments.order(created_at: :desc).page(params[:page]).per(10)
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
    @topic =Topic.active.find(params[:id])
  end

  def update
    @topic =Topic.active.find(params[:id])
    if @topic.update(topic_params)
      redirect_to artist_topic_path(@artist, @topic)
    else
      render :edit
    end
  end

  private

  def set_artist
    @artist = Artist.active.find(params[:artist_id])
    unless @artist
      redirect_to root_path, alert: "現在非公開のアーティストです。"
    end
  end

  def topic_params
    params.require(:topic).permit(:title, :body, :topic_genre_id, :image)
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_to artist_path(@artist), alert: 'ゲストユーザーはトピックを作成できません。'
    end
  end
end
