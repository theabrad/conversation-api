class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @conversations = user.conversations
    else
      @conversations = Conversation.all
    end

    render json: ConversationSerializer.new(@conversations)
  end
  def create
    @conversation = Conversation.new(conversation_params)
    
    if @conversation.save
      UserConversation.create(user: current_user, conversation: @conversation)
      render json: ConversationSerializer.new(@conversation)
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  private
  
  def conversation_params
    params.require(:conversation).permit(:name)
  end
end
