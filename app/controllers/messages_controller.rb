class MessagesController < ApplicationController

  before_action :involved_group, only: [ :index, :create ]

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    # binding.pry
    @messages = Message.where(group_id: params[:group_id])
    respond_to do |format|
      format.html
      format.json{
        @messages_add = @group.messages.find(params[:last_id])
        # @messages_add = @group.messages.where('id > ?', params[:last_id])
      }
    end
  end

  def create
    @message = Message.new(messages_params)
    # binding.pry
    if @message.save
      flash[:notice] = "メッセージを送信しました"
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json
      end
    else
      flash[:alert] = "本文を入力してください。"
      redirect_to group_messages_path
    end
  end 

  def involved_group
    @groups = current_user.groups
  end

  private
  def messages_params
    params.require(:message).permit(:body, :image, :group_id).merge(user_id: current_user.id)
  end
end
