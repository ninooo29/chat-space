class GroupsController < ApplicationController
  def new
    @groups = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to :root and return
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def update
  end

  private
  def create_params
    params.require(:group).permit(:group_name, { :user_ids=> [] })
  end
end
