class Public::GroupCommentsController < ApplicationController
  before_action :set_group

  def create
    @comment = @group.group_comments.new(group_comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to group_path(@group)
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
end
