class TopController < ApplicationController
  def index
    @group_users = GroupUser.where(user_id: current_user.id)
  end
end
