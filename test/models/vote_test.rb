require "test_helper"

class VoteTest < ActiveSupport::TestCase
  setup do
    @vote_yes = votes(:one)
    @vote_no = votes(:two)
  end

  test "yes vote should change vote type to yes" do
    assert_equal "No", @vote_no.vote_type
    @vote_no.yes
    assert_equal "Yes", @vote_no.vote_type
  end

  test "no vote should change vote type to no" do
    assert_equal "Yes", @vote_yes.vote_type
    @vote_yes.no
    assert_equal "No", @vote_yes.vote_type
  end

end
