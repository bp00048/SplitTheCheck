require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end

  test "should search a restaurant by name" do
    visit restaurants_url
    fill_in "name", with: "Test"

    click_on "searchname"
    assert_text "Test"
    assert_text "City, ST"
  end

  test "should search a restaurant by location" do
    visit restaurants_url
    fill_in "location", with: "City"

    click_on "searchlocation"
    assert_text "Test"
    assert_text "City, ST"

  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Search"
  end

  test "creating a Restaurant" do
    sign_in @user
    visit restaurants_url
    click_on "Add Restaurant"

    fill_in "location", with: @restaurant.location
    fill_in "name", with: @restaurant.name

    fill_in "website", with: @restaurant.website

    click_on "Create Restaurant"

    assert_text "Not Enough Votes!"
    click_on "Back"
  end

  test "updating a Restaurant" do
    sign_in @user
    visit restaurant_path(@restaurant)
    click_on "Edit", match: :first

    fill_in "location", with: @restaurant.location
    fill_in "name", with: @restaurant.name

    fill_in "website", with: @restaurant.website

    click_on "Update Restaurant"

    assert_text @restaurant.name
    click_on "Back"
  end
end
