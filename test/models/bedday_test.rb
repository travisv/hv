require 'test_helper'

class BeddayTest < ActiveSupport::TestCase
  def setup
    @client = Client.create!(name: 'Example User', titleXIX: '1234567A')
    @bedday = @client.create_bedday
    @homevisit = @client.homevisits.new(departure_date: '2000-1-1',
                                           return_date: '2000-1-3')
  end

  test 'Default Bed days should be 30' do
    assert_equal 30, @bedday.remaining
  end

  test 'Bed days should be removed for each Homevisit day' do
    @homevisit.save
    assert_equal 28, @bedday.remaining
  end
end

