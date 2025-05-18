class Public::ArtistTagsController < ApplicationController
  def show
    @artist_tag = ArtistTag.find_by(name: params[:name])
    if @artist_tag.nil?
      # タグが見つからなければ、アーティスト一覧へリダイレクトなど適宜対応
      redirect_to artists_path, alert: "タグ「#{params[:name]}」は存在しません。"
    else
      # タグに紐づくアーティスト一覧を取得
      @artists = @artist_tag.artists.page(params[:page]).per(10)  # kaminariなどページネーション使ってる場合
    end
  end
  def create
  end

  def destroy
  end
end
