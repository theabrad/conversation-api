class MessagesController < ApplicationController

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages

    render json: MessageSerializer.new(@messages)
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = current_user.messages.build(message_params)
    @message.conversation_id = @conversation.id

    if @message.save
      render json: MessageSerializer.new(@message)
    else
      render json: @message.errors
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
