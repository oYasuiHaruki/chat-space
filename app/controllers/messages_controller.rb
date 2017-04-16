class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージが送信されました"
      redirect_to(group_messages_path)
    else
      flash[:alert] = "メッセージを入力してください"
      redirect_to(group_messages_path)
    end

  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
