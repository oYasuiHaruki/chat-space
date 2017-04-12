class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループが作成されました"
      redirect_to(root_path)
    else
      flash[:alert] = "グループ名を入力してください"
      render action: :new
    end

  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "グループが編集されました"
      redirect_to(root_path)
    else
      flash[:alert] = "グループ名を入力してください"
      render action: :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

end
