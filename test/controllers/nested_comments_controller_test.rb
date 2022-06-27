require "test_helper"

class NestedCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nested_comment = nested_comments(:one)
  end

  test "should get index" do
    get nested_comments_url, as: :json
    assert_response :success
  end

  test "should create nested_comment" do
    assert_difference("NestedComment.count") do
      post nested_comments_url, params: { nested_comment: { direct_comment_id: @nested_comment.direct_comment_id, text: @nested_comment.text, user_id: @nested_comment.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show nested_comment" do
    get nested_comment_url(@nested_comment), as: :json
    assert_response :success
  end

  test "should update nested_comment" do
    patch nested_comment_url(@nested_comment), params: { nested_comment: { direct_comment_id: @nested_comment.direct_comment_id, text: @nested_comment.text, user_id: @nested_comment.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy nested_comment" do
    assert_difference("NestedComment.count", -1) do
      delete nested_comment_url(@nested_comment), as: :json
    end

    assert_response :no_content
  end
end
