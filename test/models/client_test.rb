require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup  
    @client = Client.create!(name: 'Example User', titleXIX: '1234567A')
    @bedday = @client.create_bedday
    @homevisit = @client.homevisits.new(departure_date: '2000-1-1',
                                        return_date: '2000-1-3')
  end 

  test 'client should be valid with all attributes' do
    assert @client.valid?
  end

  test 'client should be invalid without name' do
    @client.name = ''
    assert !@client.valid?
  end

  test 'client should be invaild without titleXIX number' do
    @client.titleXIX = ''
    assert !@client.valid?
  end

  test 'client should be invalid with improper titleXIX format' do
    invalid_titleXIX = %w(123456A 123ADFS 1234567a A1234567)
    invalid_titleXIX.each do |invalid|
      @client.titleXIX = invalid
    end
    assert !@client.valid?
  end

  test 'client should be valid with proper titleXIX format' do
    valid_titleXIX = %w(1234567A 3420952Z 9823111G 0000000S)
    valid_titleXIX.each do |valid|
      @client.titleXIX = valid
    end
    assert @client.valid?
  end

  test 'clients titleXIX number should be unique' do
    duplicate_client = @client.dup
    assert !duplicate_client.valid?
  end

  test 'Default Bed days should be 30' do
    assert_equal 30, @client.bedday.remaining
  end

  test 'Bed days should be calculated after homevisit is saved' do
    @homevisit.save
    assert_equal 2, @client.days_gone
  end

  test 'Bed days should be removed for each Homevisit day' do
    @homevisit.save
    assert_equal 28, @client.current_beddays
  end
end
