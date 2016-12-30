class MessagesController < ApplicationController

  before_action :involved_group, only: [ :index, :create ]

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
  end

  def create
    Message.create(messages_params)
    redirect_to group_messages_path
  end

  def involved_group
    @groups = current_user.groups
  end

  private
  def messages_params
    params.require(:message).permit(:body, :group_id).merge(user_id: current_user.id)
  end
end