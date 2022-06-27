class DirectCommentsController < ApplicationController
  before_action :set_direct_comment, only: %i[ show update destroy ]

  # GET /direct_comments
  def index
    @direct_comments = DirectComment.all

    render json: @direct_comments
  end

  # GET /direct_comments/1
  def show
    render json: @direct_comment
  end

  # POST /direct_comments
  def create
    @direct_comment = DirectComment.new(direct_comment_params)

    if @direct_comment.save
      render json: @direct_comment, status: :created, location: @direct_comment
    else
      render json: @direct_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /direct_comments/1
  def update
    if @direct_comment.update(direct_comment_params)
      render json: @direct_comment
    else
      render json: @direct_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /direct_comments/1
  def destroy
    @direct_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direct_comment
      @direct_comment = DirectComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def direct_comment_params
      params.require(:direct_comment).permit(:text, :user_id, :conversation_id)
    end
end
