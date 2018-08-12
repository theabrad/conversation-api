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

  describe 'GET /users/:user_id/conversations' do
    it 'gets a list of all conversations a user has' do
      user = create(:user)
      conversations = create_list(:conversation, 5) 
      user.conversations << conversations

      get "/users/#{user.id}/conversations", headers: auth_headers(user)

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data'].size).to eq(5)
    end
  end

  describe 'POST /users/:user_id/conversations/:conversation_id/adduser' do
    it 'adds a user to the conversation' do
      user = create(:user)
      conversation = create(:conversation)

      post "/users/#{user.id}/conversations/#{conversation.id}/adduser", headers: auth_headers(user)

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data']['relationships']['users']['data'].last['id']).to eq(user.id.to_s)
    end
  end
end
