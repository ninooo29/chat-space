class GroupsController < ApplicationController
  def new
    @groups = Group.new
  end

  def create
    @group = Group.new(create_params)


    if @group.group_name.empty?
      flash[:alert] = "グループ名を入力してください"
      redirect_to new_group_path and return
    elsif @group.save
      flash[:notice] = 'チャットグループが作成されました。'
      redirect_to :root and return
    end
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def update
  end

  private
  def create_params
    params.require(:group).permit(:group_name, { user_ids: [] })
  end
end
