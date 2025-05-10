class Public::GroupCommentsController < ApplicationController
  before_action :set_group

  def create
    @comment = @group.group_comments.new(group_comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to group_path(@group)
  end

  def destroy
    @comment = @group.group_comments.find(params[:id])
    @comment.destroy
    redirect_to group_path(@group)
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_comment_params
    params.require(:group_comment).permit(:body)
  end
end
