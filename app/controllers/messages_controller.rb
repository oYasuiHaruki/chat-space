class MessagesController < ApplicationController

  before_action :set_variables, only:[:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージが送信されました"
      redirect_to(group_messages_path)
    else
      flash.now[:alert] = "メッセージを入力してください"
      render action: :index
    end
  end

  private

  def set_variables
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @messages = @group.messages
  end

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
