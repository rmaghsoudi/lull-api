require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do
    {
      user: {
        email: 'user@example.com',
        password: 'Password1%',
        firstName: "Ronald",
        lastName: "McDonald"
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      new_user = User.find(response.parsed_body['id'])
      expect(response.parsed_body['id']).to eq(new_user.id)
    end
  end

  context 'when user already exists' do
    before do
      Fabricate :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      expect(response.parsed_body['errors'].first['title']).to eq('Bad Request')
    end
  end
end