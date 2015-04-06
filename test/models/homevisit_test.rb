require 'test_helper'

class HomevisitTest < ActiveSupport::TestCase
  def setup
    @client = Client.create!(name: 'Example User', titleXIX: '1234567A')
    @homevisit = @client.homevisits.build(departure_date: '2000-01-01',
                                          return_date: '2000-01-03', client_id: @client.id)
  end

  test 'homevisit should be valid with proper attributes' do
    assert @homevisit.valid?
  end

  test 'homevist is invalid without departure date' do
    @homevisit.departure_date = ''
    assert !@homevisit.valid?
  end

  test 'homevist is invalid without return date' do
    @homevisit.return_date = ''
    assert !@homevisit.valid?
  end

  test 'homevist should belong to a client' do
    @homevisit.client_id = ''
    assert !@homevisit.valid?
  end

  test 'homevisit date should have valid format' do
    @homevisit.return_date = '19a-1'
    assert !@homevisit.valid?
  end

  test 'homevisit should calculate its length' do
    assert_equal 2, @homevisit.days
  end
end
