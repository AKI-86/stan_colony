class Public::ChatMessagesController < ApplicationController
  before_action :set_group
  before_action :authorize_group_member!

  def index
    # 現在はスクロールにして表示しているがページネーションも検討
    @chat_messages = @group.chat_messages.includes(:user).order(:created_at)
    @chat_message = ChatMessage.new
  end

  def create
    @chat_message = @group.chat_messages.build(chat_message_params)
    @chat_message.user = current_user

    if @chat_message.save
      redirect_to group_chat_messages_path(@group)
    else
      @chat_messages = @group.chat_messages.includes(:user).order(:created_at)
      render :index
    end
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:body)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  # チャットは会員or管理者のみに設定
  def authorize_group_member!
    if admin_signed_in?
    elsif current_user && @group.members.include?(current_user)
    else
      redirect_to group_path(@group), alert: "このグループのメンバーだけがチャットを閲覧できます"
    end
  end
end
