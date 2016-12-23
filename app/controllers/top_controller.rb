class TopController < ApplicationController

  before_action :select_group, only: [ :index ]

  def index
    @groups = current_user.groups
  end

  def select_group
    @group = Group.find(params[:group_id])
  end
end
