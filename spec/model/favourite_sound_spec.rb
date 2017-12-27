require 'rails_helper'

describe FavouriteSound, type: :model do
  describe 'validations' do
    it 'is invalid without sound' do
      expect(build(:favourite_sound, sound: nil)).to_not be_valid
    end

    it 'is invalid without user' do
      expect(build(:favourite_sound, user: nil)).to_not be_valid
    end

    it 'is invalid with duplicated user and sound' do
      fs = create(:favourite_sound)
      expect(build(:favourite_sound, user: fs.user, sound: fs.sound)).to_not be_valid
    end
  end

  describe 'has a valid factory' do
    it { expect(create(:favourite_sound)).to be_valid }
  end
end
