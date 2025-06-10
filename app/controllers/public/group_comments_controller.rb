class Public::GroupCommentsController < ApplicationController
  before_action :set_group
  before_action :authenticate_user!, only: [:create]
  before_action :reject_guest_user, only: [:create]
  before_action :reject_non_member_user, only: [:create]
  
  def create
    @group_comment = @group.group_comments.new(group_comment_params)
    @group_comment.user_id = current_user.id

    respond_to do |format|
      if @group_comment.save
        # @group_comments = @group.group_comments.order(created_at: :desc).page(params[:page]).per(10)
        @group_comments = @group.group_comments.includes(user: [image_attachment: :blob]).order(created_at: :desc).page(params[:page]).per(10)
        format.js # create.js.erb を返す
      else
        # @group_comments = @group.group_comments.order(created_at: :desc).page(params[:page]).per(10)
        @group_comments = @group.group_comments.includes(user: [image_attachment: :blob]).order(created_at: :desc).page(params[:page]).per(10)
        flash.now[:alert] = "空欄または1000字以上のコメントは投稿できません"
        format.js # create.js.erb でエラー処理
      end
    end
  end

  #   if @group_comment.save
  #   redirect_to group_path(@group)
  #   else
  #     @group_comments = @group.group_comments.page(params[:page]).per(10)
  #     flash.now[:alert] = "空欄または1000字以上のコメントは投稿できません"
  #     render 'public/groups/show'  # グループ詳細ページのビューに戻る想定
  #   end
  # end

  def destroy
    @group_comment = GroupComment.find(params[:id])
    @group_comment.soft_delete
    if admin_signed_in?
      redirect_to admin_group_path(@group_comment.group), notice: "コメントを削除しました。"
    else
      redirect_to group_path(@group_comment.group), notice: "コメントを削除しました。"
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_comment_params
    params.require(:group_comment).permit(:body)
  end

  # コメントはサークルメンバーのみ(Viewでも制御)
  def reject_non_member_user
    unless @group.members.include?(current_user)
      redirect_to group_path(@group), alert: "サークルメンバーのみコメントできます。"
    end
  end

  def reject_guest_user
    if current_user&.guest?
      redirect_to group_path(params[:group_id]), alert: 'ゲストユーザーはサークルへのコメントを投稿できません。'
    end
  end
end
