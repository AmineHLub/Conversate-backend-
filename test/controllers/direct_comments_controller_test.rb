require "test_helper"

class DirectCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direct_comment = direct_comments(:one)
  end

  test "should get index" do
    get direct_comments_url, as: :json
    assert_response :success
  end

  test "should create direct_comment" do
    assert_difference("DirectComment.count") do
      post direct_comments_url, params: { direct_comment: { conversation_id: @direct_comment.conversation_id, text: @direct_comment.text, user_id: @direct_comment.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show direct_comment" do
    get direct_comment_url(@direct_comment), as: :json
    assert_response :success
  end

  test "should update direct_comment" do
    patch direct_comment_url(@direct_comment), params: { direct_comment: { conversation_id: @direct_comment.conversation_id, text: @direct_comment.text, user_id: @direct_comment.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy direct_comment" do
    assert_difference("DirectComment.count", -1) do
      delete direct_comment_url(@direct_comment), as: :json
    end

    assert_response :no_content
  end
end
