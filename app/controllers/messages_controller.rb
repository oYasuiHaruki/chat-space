class MessagesController < ApplicationController

  def index
    @group_users = GroupUser.where(user_id: current_user.id)
    @current_group = Group.find(params[:group_id])
    @users = @current_group.group_users
  end

end
