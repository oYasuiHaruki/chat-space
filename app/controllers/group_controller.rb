class GroupController < ApplicationController

  def edit

  end

  def new

  end

  def create
    Group.create(group_params)
    redirect_to("/")
  end

  private
    def group_params
      params.require(:group).permit(:name, { :user_ids => [] })
    end
end