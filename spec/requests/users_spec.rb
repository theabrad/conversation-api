require 'rails_helper'

describe 'Users API' do
  describe 'GET /users' do
    it 'retrieves a list of all users' do
      create_list(:user, 5)
      get '/users'

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data'].length).to eq(5)
    end
  end

  describe 'POST /users' do
    it 'creates a user' do
      params = { user:
                 { username: 'foo',
                   email: 'foo@bar.com',
                   password: 'password',
                   password_confirmation: 'password' } }

      post '/users', params: params

      json = JSON.parse(response.body)

      expect(response).to be_successful
      expect(json['data']['attributes']['username']).to eq('foo')
    end
  end
end
