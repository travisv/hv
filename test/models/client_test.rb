require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  setup { @client = Client.create!(name: 'Example User', titleXIX: '1234567A') }

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
    invalid_titleXIX = %w[ 123456A 123ADFS 1234567a A1234567 ]
    invalid_titleXIX.each do |invalid|
      @client.titleXIX = invalid
    end
    assert !@client.valid?
  end

  test 'client should be valid with proper titleXIX format' do
    valid_titleXIX = %w[ 1234567A 3420952Z 9823111G 0000000S ]
    valid_titleXIX.each do |valid|
      @client.titleXIX = valid
    end
    assert @client.valid?
  end

  test 'clients titleXIX number should be unique' do
    duplicate_client = @client.dup
    assert !duplicate_client.valid?
  end
end
