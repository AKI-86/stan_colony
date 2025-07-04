class Public::ArtistsController < ApplicationController
  before_action :custom_authenticate_user, only: [:new, :create, :edit, :update]
  before_action :reject_guest_user, only: [:new, :create, :edit, :update]

  def new
    @artist = Artist.new
  end

  def index
    @artists = Artist.active.order(created_at: :desc).page(params[:page]).per(12)
  end

  def show
    @artist = Artist.find_by(id: params[:id])
    unless @artist && (@artist.is_active || admin_signed_in?)
      redirect_to root_path, alert: "そのページは表示できません"
      return
    end

    # コメント数が増えた時のN+1について対応策を考える必要あり
    @topics = @artist.topics.active
    .left_joins(:comments)
    .group('topics.id')
    .order(Arel.sql('COALESCE(MAX(comments.created_at), topics.created_at) DESC'))
    .page(params[:page]).per(10)
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user_id = current_user.id

    # タグ機能、受けた値を,で配列に、stripで空白を除去、blankで空欄を除外
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?).uniq
    # タグのバリデーション
    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :new and return
    end
    invalid_tags = tag_names.select { |name| name.length > 20 }
    if invalid_tags.any?
      flash.now[:alert] = "タグは1文字以上20文字以内で入力してください。"
      render :new and return
    end

    # 各タグをArtistTagテーブルで作成、中間テーブル ATag を通して、アーティストとタグを関連付け
    if @artist.save
      tag_names.each do |tag_name|
        tag = ArtistTag.find_or_create_by(name: tag_name)
        ATag.create(artist: @artist, artist_tag: tag)
      end
      redirect_to artist_path(@artist), notice: "アーティストを作成しました。"
    else
      flash.now[:alert] = "アーティストの作成に失敗しました。"
      render :new
    end
  end

  def edit
    @artist = Artist.active.find(params[:id])
    unless admin_signed_in? || @artist.user_id == current_user.id
      redirect_to artists_path, alert: "編集権限がありません"
    end
  end

  def update
    @artist = Artist.find(params[:id])

    # タグ機能、受けた値を,で配列に、stripで空白を除去、blankで空欄を除外
    tag_names = params[:tag_names].to_s.split(',').map(&:strip).reject(&:blank?).uniq
    # タグのバリデーション
    if tag_names.size > 10
      flash.now[:alert] = "タグは最大10個までです。"
      render :edit and return
    end
    invalid_tags = tag_names.select { |name| name.length > 20 }
    if invalid_tags.any?
      flash.now[:alert] = "タグは1文字以上20文字以内で入力してください。"
      render :new and return
    end

    if @artist.update(artist_params)
      # 古いタグの関連付けを削除
      @artist.a_tags.destroy_all
      # 新しいタグを再登録
      tag_names.each do |tag_name|
        tag = ArtistTag.find_or_create_by(name: tag_name)
        ATag.create(artist: @artist, artist_tag: tag)
      end
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def favorited_users
    @artist = Artist.active.find(params[:id])
    @users = @artist.favorited_users
  end

  private
  
  def artist_params
    params.require(:artist).permit(:name, :image, :introduction)
  end

  # ゲストユーザーの投稿を禁止
  def reject_guest_user
    if current_user.guest?
      redirect_to artists_path, alert: 'ゲストユーザーはアーティストページを作成できません。'
    end
  end
end

