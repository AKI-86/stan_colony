class Public::GroupMembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :reject_guest_user, only: [:create]

  def create
    @group = Group.active.find(params[:group_id])
    current_user.group_memberships.create(group: @group)
    redirect_to group_path(@group), notice: "参加しました"
  end

  def destroy
    @group = Group.active.find(params[:group_id])
    membership = current_user.group_memberships.find_by(group: @group)
    membership&.destroy
    redirect_to group_path(@group), notice: "脱退しました"
  end

  private
  def reject_guest_user
    if current_user&.guest?
      redirect_to groups_path, alert: 'ゲストユーザーはグループに参加できません。'
    end
  end
end
