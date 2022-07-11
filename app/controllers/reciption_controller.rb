class ReciptionController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def create
    @convo = pwd_params[:password]
    @found_convo = Conversation.where(password: @convo)
    if @found_convo != []
      render json: json_creator(@found_convo), status: :created
    else
      render json: 'not found', status: :not_found
    end
  end

  private

  def pwd_params
    params.require(:reciption).permit(:password)
  end

  def json_creator(conversation)
    @convo = conversation[0]
    @convo_json = {
      id: @convo.id,
      password: @convo.password,
      text: @convo.text,
      # owner: User.find(@convo.user_id),
      comments: comments_json(@convo.direct_comments)
    }
    @convo_json
  end

  def comments_json(directcoms)
    directcoms.map do |directcom|
      {
        direct_comment: directcom,
        nested_comments: directcom.nested_comments
      }
    end
  end
end
