require 'test_helper'

class JewelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create incorrect jewel" do
  	assert_not Jewel.build(jewels(:one))
  end
end
