require 'rails_helper'

describe 'Conversations API' do
  describe 'POST /conversations' do
    it 'creates a conversation with a name' do
      user = create(:user)

      params = { conversation:
                  { name: 'foo' } }

      post '/conversations', params: params, headers: auth_headers(user)

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data']['attributes']['name']).to eq('foo')
    end
  end
end
