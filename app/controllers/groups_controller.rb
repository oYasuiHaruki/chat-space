class GroupsController < ApplicationController

  before_action :set_group, only:[:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループが作成されました"
      redirect_to(root_path)
    else
      flash.now[:alert] = "グループ名を入力してください"
      render action: :new
    end

  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "グループが編集されました"
      redirect_to(root_path)
    else
      flash.now[:alert] = "グループ名を入力してください"
      render action: :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
