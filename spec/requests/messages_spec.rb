require 'rails_helper'

describe 'Messages API' do
  describe 'POST /conversations/:id/messages' do
    it 'creates a message and sends it to a conversation' do
      user = create(:user)
      conversation = create(:conversation)
      user.conversations << conversation

      params = { message:
                 { body: 'foobar' } }

      post "/conversations/#{conversation.id}/messages", params: params, headers: auth_headers(user)

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data']['attributes']['body']).to eq('foobar')
    end
  end

  describe 'GET /conversations/:id/messages' do
    it 'gets a list of all messages belonging to a conversation' do
      user = create(:user)
      conversation = create(:conversation)
      user.conversations << conversation
      messages = create_list(:message, 5)
      conversation.messages <<  messages

      get "/conversations/#{conversation.id}/messages", headers: auth_headers(user)

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data'].size).to eq(5)
    end
  end
end
