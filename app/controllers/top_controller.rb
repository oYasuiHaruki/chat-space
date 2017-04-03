class TopController < ApplicationController
  def index
    @group = Group.all
  end
end
