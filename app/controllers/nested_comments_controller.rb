class NestedCommentsController < ApplicationController
  before_action :set_nested_comment, only: %i[ show update destroy ]

  # GET /nested_comments
  def index
    @nested_comments = NestedComment.all

    render json: @nested_comments
  end

  # GET /nested_comments/1
  def show
    render json: @nested_comment
  end

  # POST /nested_comments
  def create
    @nested_comment = NestedComment.new(nested_comment_params)
    @nested_comment.username = User.find(@nested_comment.user_id).name
    if @nested_comment.save
      render json: @nested_comment, status: :created, location: @nested_comment
    else
      render json: @nested_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nested_comments/1
  def update
    if @nested_comment.update(nested_comment_params)
      render json: @nested_comment
    else
      render json: @nested_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nested_comments/1
  def destroy
    @nested_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nested_comment
      @nested_comment = NestedComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nested_comment_params
      params.require(:nested_comment).permit(:text, :user_id, :direct_comment_id)
    end
end
