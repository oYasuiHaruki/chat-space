class TopController < ApplicationController
  def index
    @group = Group.new
    @groups = current_user.groups
  end
end
