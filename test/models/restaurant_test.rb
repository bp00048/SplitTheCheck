require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "yes vote should add 1 to yes split" do
    @restaurant.yes
    assert_equal 2, @restaurant.yes_split
  end

  test "no vote should add 1 to no split" do
    @restaurant.no
    assert_equal 2, @restaurant.no_split
  end

end
