require 'test_helper'

class HomevisitCreateTest < ActionDispatch::IntegrationTest
  def setup
    @client = Client.create!(name: 'Example User', titleXIX: '1234567A')
  end

  test 'creating homevisit with invalid data' do
    get new_client_homevisit_path(@client)
    assert_no_difference 'Homevisit.count' do
      post client_homevisits_path(@client), homevisit: { departure_date: '',
                                                         return_date: '' }
    end
    assert_template 'homevisits/new'
  end

  test 'creating homevisit with valid data' do
    get new_client_homevisit_path(@client)
    assert_difference 'Homevisit.count', 1 do
      post_via_redirect client_homevisits_path(@client),
                        homevisit: { departure_date: '2000-01-10',
                                     return_date: '2000-01-13' }
    end
    assert_template 'homevisits/index'
  end
end
