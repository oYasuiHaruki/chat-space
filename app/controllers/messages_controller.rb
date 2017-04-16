class MessagesController < ApplicationController

  before_action :index_variable, only:[:index, :create]

  def index
  end

  def create
    @post_message = Message.new(message_params)
    if @post_message.save
      flash.now[:notice] = "メッセージが送信されました"
      render action: :index
    else
      flash.now[:alert] = "メッセージを入力してください"
      render action: :index
    end

  end

  private

  def index_variable
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @users = @group.users
    @message = Message.new
    @messages = @group.messages
  end

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
