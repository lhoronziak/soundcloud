require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it 'is invalid without username' do
      expect(build(:user, username: nil)).to_not be_valid
    end

    it 'is invalid without password' do
      expect(build(:user, encrypted_password: nil)).to_not be_valid
    end

    it 'is invalid with duplicated username' do
      user = create(:user)
      expect(build(:user, username: user.username)).to_not be_valid
    end
  end

  describe 'has a valid factory' do
    it { expect(create(:user)).to be_valid }
  end
end
