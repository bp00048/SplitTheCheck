require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end


  test "should create yes vote" do
    #Last test Vote object is of type "No"
      assert(Vote.last.vote_type, "No")
    #Tests that a new Vote object is added
      assert_difference('Vote.count') do
      sign_in @user
      post votes_path, params: { vote: { restaurant_id: @restaurant.id, vote_type: "Yes" }}
    end
    #New Vote object added is of type "Yes"
    assert(Vote.last.vote_type, "Yes")
  end

  test "should create no vote" do
    #Last test Vote object is of type "No"
      assert(Vote.last.vote_type, "No")
    #Tests that a new Vote object is added
      assert_difference('Vote.count') do
      sign_in @user
      post votes_path, params: { vote: { restaurant_id: @restaurant.id, vote_type: "No" }}
    end
      #New Vote object added is of type "No"
    assert(Vote.last.vote_type, "No")
  end
end
