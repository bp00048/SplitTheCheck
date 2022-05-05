require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

setup do
  @restaurant = restaurants(:one)
  @user = users(:one)
end


test "should create new comment" do
  sign_in @user
  post restaurant_comments_path(@restaurant), params: {comment: {content: "test content"}}
  assert_response :redirect
end
end
