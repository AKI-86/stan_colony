class Public::SearchesController < ApplicationController
  def index
    @keyword = params[:q]  # 検索キーワード

    # Ransackで各モデル検索
    @q_artist = Artist.active.ransack(name_cont: @keyword)
    @artists = @q_artist.result(distinct: true)

    @q_user = User.active.ransack(name_cont: @keyword)
    @users = @q_user.result(distinct: true).merge(User.without_guests).includes(:artists, :topics, :owned_groups, :comments)

    @q_group = Group.active.ransack(name_cont: @keyword)
    @groups = @q_group.result(distinct: true)
  end
end

