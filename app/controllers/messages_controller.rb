class MessagesController < ApplicationController

  before_action :select_group, only: [ :index ]

  def index
    @groups = current_user.groups
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
  end

  def select_group
    @group = Group.find(params[:group_id])
  end

  def create
    Message.create(messages_params)
    @groups = current_user.groups
    redirect_to action: "index"
  end

  private
  def messages_params
    params.require(:message).permit(:body, :group_id).merge(user_id: current_user.id)
  end
end
