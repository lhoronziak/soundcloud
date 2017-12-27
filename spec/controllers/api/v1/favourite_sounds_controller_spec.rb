require 'rails_helper'

describe Api::V1::FavouriteSoundsController, type: :controller do
  let!(:sound) { create(:sound) }
  let!(:user) { create(:user) }
  let!(:token) { double acceptable?: true }

  before do
    stub_access_token(token)
    stub_current_user(user)
  end

  describe 'GET #index' do
    context 'with valid attributes' do
      it 'get favourite sounds' do
        create_list(:favourite_sound, 3, user: user)
        get :index
        expect(json.length).to eq 3
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new favourite sound' do
        expect { post :create, params: { sound_id: sound.id } }.to change {
          user.favourite_sounds.count
        }.by(1)
        expect(response.status).to eq 201
      end

      it 'dont create duplicated favourite sounds' do
        create(:favourite_sound, user: user, sound: sound)
        expect { post :create, params: { sound_id: sound.id } }.to change {
          user.favourite_sounds.count
        }.by(0)
      end
    end

    context 'with invalid attributes' do
      it 'return not found with wrong song id' do
        post :create, params: { sound_id: 0 }
        expect(response.status).to eq 404
      end

      it 'return bad request when params is missing' do
        post :create
        expect(response.status).to eq 400
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      it 'remove favourite sound' do
        fs = create(:favourite_sound, user: user, sound: sound)
        expect { delete :destroy, params: { id: fs.id } }.to change {
          user.favourite_sounds.count
        }.by(-1)
        expect(response.status).to eq 200
      end

      it 'cant remove other user favourite sounds' do
        fs = create(:favourite_sound, sound: sound)
        expect { delete :destroy, params: { id: fs.id } }.to change {
          FavouriteSound.count
        }.by(0)
        expect(response.status).to eq 404
      end
    end
  end
end
