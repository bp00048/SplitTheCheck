require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Search"
  end

  test "creating a Restaurant" do
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
