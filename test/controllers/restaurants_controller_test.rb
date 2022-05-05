require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end


  test "should get new" do
    sign_in @user
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
      assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: @restaurant.location, name: @restaurant.name, no_split: @restaurant.no_split, website: @restaurant.website, yes_split: @restaurant.yes_split } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end


  test "should show restaurant" do
    sign_in @user
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    sign_in @user
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name, no_split: @restaurant.no_split, website: @restaurant.website, yes_split: @restaurant.yes_split } }
    assert_redirected_to restaurant_url(@restaurant)
  end


  test "should remain on page after yes vote" do
    put yes_path(@restaurant)
    assert_redirected_to restaurant_url(@restaurant)
    end

    test "should remain on page after no vote" do
      put no_path(@restaurant)
      assert_redirected_to restaurant_url(@restaurant)
      end


    end
