class Public::SearchesController < ApplicationController
  def search
    # パラメータからカテゴリーとキーワードを取得
    category = params[:category]
    keyword = params[:keyword]

    # カテゴリーに応じて検索対象を決定
    @category = category # カテゴリーをインスタンス変数に保存してビューで使用
    case category
    when 'アーティスト'
      @results = Artist.where("name LIKE ?", "%#{keyword}%")
    when 'ユーザー'
      @results = User.where("name LIKE ?", "%#{keyword}%")
    when 'コミュニティ'
      @results = Group.where("name LIKE ?", "%#{keyword}%")
    else
      @results = []
    end
  end
end
