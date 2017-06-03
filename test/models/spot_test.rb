require 'test_helper'

class SpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  
    def setup
    @spot = Spot.new(title: 'John Street', address: "90 John street", phonenumber: '15184059043')
  end

  test 'valid spot' do
    assert @spot.valid?
  end

  test 'invalid without title' do
    @spot.title = nil
    refute @spot.valid?, 'saved spot without a title'
    assert_not_nil @spot.errors[:title], 'no validation error for name present'
  end

  test 'invalid without address' do
    @spot.address = nil
    refute @spot.valid?
    assert_not_nil @spot.errors[:address]
  end
end
