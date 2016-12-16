class GroupsController < ApplicationController
  def new
    @groups = Group.new
  end

  def create
  end

  def edit
    @group = Group.find(params[:group_id])
  end

  def update
  end
end
