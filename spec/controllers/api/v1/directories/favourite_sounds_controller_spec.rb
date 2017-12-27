require 'rails_helper'

describe Api::V1::Directories::FavouriteSoundsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:directory) { create(:directory, user: user) }
  let!(:fs) { create(:favourite_sound, user: user) }
  let!(:token) { double acceptable?: true }

  before do
    stub_access_token(token)
    stub_current_user(user)
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'move favourite sound to directory' do
        expect { post :create, params: { directory_id: directory.id, favourite_sound_id: fs.id } }.to change {
          directory.favourite_sounds.count
        }.by(1)
        expect(response.status).to eq 201
      end
    end

    context 'with invalid attributes' do
      it 'return not found with wrong song id' do
        post :create, params: { directory_id: 0, favourite_sound_id: fs.id }
        expect(response.status).to eq 404
      end

      it 'return bad request when params is missing' do
        post :create, params: { directory_id: 0 }
        expect(response.status).to eq 400
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      it 'remove directory from favourite sound' do
        fs.update(directory_id: directory.id)
        expect { delete :destroy, params: { directory_id: directory.id, favourite_sound_id: fs.id } }.to change {
          directory.favourite_sounds.count
        }.by(-1)
        expect(response.status).to eq 200
      end
    end
  end
end
