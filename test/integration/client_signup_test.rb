require 'test_helper'

class ClientSignupTest < ActionDispatch::IntegrationTest
  test 'invalid Client information' do
    get new_client_path
    assert_no_difference 'Client.count' do
      post clients_path, client: { name: '',
                                   titleXIX: 'user@invalid' }
    end
    assert_template 'clients/new'
  end

  test 'valid Client information' do
    get new_client_path
    assert_difference 'Client.count', 1 do
      post_via_redirect clients_path, client: { name: 'Example Client',
                                                titleXIX: '1234567A' }
    end
    assert_template 'clients/show'
  end
end
