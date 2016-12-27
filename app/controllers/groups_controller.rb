class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root and return
    else
      flash[:alert] = "グループ名を入力してください。"
      redirect_to new_group_path and return
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = 'チャットグループが更新されました'
      redirect_to :root and return
    else
      flash[:alert] = "グループ名を入力してください。"
      redirect_to edit_group_path and return
    end
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, { user_ids: [] })
  end
end
