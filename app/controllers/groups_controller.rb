class GroupsController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
    @groups = Group.new
  end

  def create
    @group = Group.new(create_params)
    @group.user_ids << current_user.id
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root and return
    else
      flash[:alert] = "グループ名を入力してください。"
      redirect_to new_group_path and return
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(update_params)
      flash[:notice] = 'チャットグループが更新されました'
      redirect_to :root and return
    else
      flash[:alert] = "グループ名を入力してください。"
      redirect_to edit_group_path and return
    end
  end

  private
  def create_params
    params.require(:group).permit(:name, { user_ids: [] })
  end

  def update_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
