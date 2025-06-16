class Public::GroupTagsController < ApplicationController
  def show
    @group_tag = GroupTag.find_by(name: params[:name])
    if @group_tag.nil?
      # タグが見つからなければ、アーティスト一覧へリダイレクトなど適宜対応
      redirect_to groups_path, alert: "タグ「#{params[:name]}」は存在しません。"
    else
      # タグに紐づくアーティスト一覧を取得
      @groups = @group_tag.groups.active.page(params[:page]).per(10)
    end
  end
end
