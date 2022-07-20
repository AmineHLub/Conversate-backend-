class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[show update destroy]

  def show
    render json: @conversation
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.password = pwd_creation

    if @conversation.save
      render json: @conversation, status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @conversation.update(conversation_params)
      render json: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @conversation.destroy
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def pwd_creation
    @o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    @string = (0...25).map { @o[rand(@o.length)] }.join
  end

  def conversation_params
    params.require(:conversation).permit(:text, :user_id)
  end
end
