class MessagesController < ApplicationController

  def index
    @group = Group.all
    @current_group = Group.find(params[:group_id])
    @user = @current_group.group_users
  end

end
