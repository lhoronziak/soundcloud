require 'rails_helper'

describe Api::V1::SoundsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:token) { double acceptable?: true }

  before do
    stub_access_token(token)
    stub_current_user(user)
  end

  describe 'GET #index' do
    context 'with valid attributes' do
      it 'get sounds' do
        create_list(:sound, 3)
        get :index
        expect(json.length).to eq 3
        expect(response.status).to eq 200
      end
    end
  end
end
