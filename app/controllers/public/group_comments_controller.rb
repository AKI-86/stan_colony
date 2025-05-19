class Public::GroupCommentsController < ApplicationController
  before_action :set_group
  before_action :reject_guest_user, only: [:create]
  
  def create
    @group_comment = @group.group_comments.new(group_comment_params)
    @group_comment.user_id = current_user.id

    if @group_comment.save
    redirect_to group_path(@group)
    else
      @group_comments = @group.group_comments.page(params[:page]).per(10)
      flash.now[:alert] = "空欄のコメントは投稿できません"
      render 'public/groups/show'  # グループ詳細ページのビューに戻る想定
    end
  end

  def destroy
    @group_comment = GroupComment.find(params[:id])
    @group_comment.soft_delete
    flash[:notice] = "コメントは削除されました"
    redirect_to group_path(@group_comment.group)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_comment_params
    params.require(:group_comment).permit(:body)
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_to group_path(params[:group_id]), alert: 'ゲストユーザーはサークルへのコメントを投稿できません。'
    end
  end
end
