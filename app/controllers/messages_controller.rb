class MessagesController < ApplicationController

  before_action :involved_group, only: [ :index, :create ]

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
    respond_to do |format|
      format.any
      format.json { render json: @messages.map { |message| message.api_json } }
    end
  end

  def create
    @message = Message.new(messages_params)
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
