require "test_helper"

class SummaryControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
  @restaurant = restaurants(:one)
  @user = users(:one)
  end


  test "loads for current user" do
  sign_in @user
  get user_summary_path(@user)
  assert_response :success
  end
end
