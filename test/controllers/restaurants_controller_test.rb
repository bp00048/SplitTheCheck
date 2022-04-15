require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)

  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end


  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
      assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: @restaurant.location, name: @restaurant.name, no_split: @restaurant.no_split, website: @restaurant.website, yes_split: @restaurant.yes_split } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should search a restaurant by name" do
    assert(2, Restaurant.all.count)
    get searchName_path, params: { n: "Test" }
    assert(1, Restaurant.all.count)
  end

  test "should search a restaurant by location" do
    assert(2, Restaurant.all.count)
    get searchName_path, params: { s: "Second City" }
    assert(1, Restaurant.all.count)
  end


  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name, no_split: @restaurant.no_split, website: @restaurant.website, yes_split: @restaurant.yes_split } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
    delete restaurant_url(@restaurant)
    end
    assert_redirected_to restaurants_url
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
