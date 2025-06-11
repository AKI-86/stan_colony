class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @keyword = params[:q]  # 検索キーワード

    # Ransackで各モデル検索
    @q_artist = Artist.ransack(name_cont: @keyword)
    @artists = @q_artist.result(distinct: true)

    @q_user = User.ransack(name_cont: @keyword)
    @users = @q_user.result(distinct: true).merge(User.without_guests).includes(:artists, :topics, :owned_groups, :comments)

    @q_group = Group.ransack(name_cont: @keyword)
    @groups = @q_group.result(distinct: true)
  end
end
