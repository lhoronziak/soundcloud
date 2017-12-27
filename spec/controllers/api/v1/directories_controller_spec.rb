require 'rails_helper'

describe Api::V1::DirectoriesController, type: :controller do
  let!(:directory) { create(:directory, user: user) }
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
        expect(json['children'].length).to eq 1
        expect(json['sounds'].length).to eq 3
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new directory without parent' do
        expect { post :create, params: { name: 'Ram Pam Pam' } }.to change {
          user.directories.count
        }.by(1)
        expect(response.status).to eq 201
      end

      it 'create new directory with parent' do
        expect { post :create, params: { name: 'Ram Pam Pam', parent_id: directory.id } }.to change {
          user.directories.count
        }.by(1)
        expect(json['parent_id']).to eq directory.id
        expect(response.status).to eq 201
      end
    end

    context 'with invalid attributes' do
      it 'return bad request when params is missing' do
        post :create
        expect(response.status).to eq 400
      end
    end
  end

  describe 'GET #show' do
    context 'with valid attributes' do
      it 'create new directory' do
        get :show, params: { id: directory.id }
        expect(json).to include_json(name: directory.name)
        expect(response.status).to eq 200
      end
    end

    context 'with invalid attributes' do
      it 'return not found' do
        get :show, params: { id: 0 }
        expect(response.status).to eq 404
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid attributes' do
      it 'remove directory' do
        expect { delete :destroy, params: { id: directory.id } }.to change {
          user.directories.count
        }.by(-1)
        expect(response.status).to eq 200
      end
    end
  end
end
