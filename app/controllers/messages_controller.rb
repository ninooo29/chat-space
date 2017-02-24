class MessagesController < ApplicationController

  before_action :involved_group, only: [ :index, :create ]

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
  end

  def create
    @message = Message.new(messages_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json { render json:
          { message:
            { name: @message.user.name,
              created_at: @message.created_at,
              body: @message.body,
              image: @message.image.url
            }
          }
        }
      end
      flash[:notice] = "メッセージを送信しました"
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
