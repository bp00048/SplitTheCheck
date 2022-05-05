require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end


  test "should get update" do
    sign_in @user
    get favorites_update_url, params: { restaurant: @restaurant.id }
    assert_response :redirect
  end
end
