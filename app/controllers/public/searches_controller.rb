class Public::SearchesController < ApplicationController
  def index
    @keyword = params[:q]  # 検索キーワード

    # Ransackで各モデル検索
    @q_artist = Artist.ransack(name_cont: @keyword)
    @artists = @q_artist.result(distinct: true)

    @q_user = User.ransack(name_cont: @keyword)
    @users = @q_user.result(distinct: true)

    @q_group = Group.ransack(name_cont: @keyword)
    @groups = @q_group.result(distinct: true)
  end
end










  # def search
  #   # パラメータからカテゴリーとキーワードを取得
  #   category = params[:category]
  #   keyword = params[:keyword]

  #   # カテゴリーに応じて検索対象を決定
  #   @category = category # カテゴリーをインスタンス変数に保存してビューで使用
  #   case category
  #   when 'アーティスト'
  #     @results = Artist.where("name LIKE ?", "%#{keyword}%")
  #   when 'ユーザー'
  #     @results = User.where("name LIKE ?", "%#{keyword}%")
  #   when 'コミュニティ'
  #     @results = Group.where("name LIKE ?", "%#{keyword}%")
  #   else
  #     @results = []
  #   end
  # end

