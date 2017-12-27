require 'rails_helper'

describe Sound, type: :model do
  describe 'validations' do
    it 'is invalid without name' do
      expect(build(:sound, name: nil)).to_not be_valid
    end

    it 'is invalid without url' do
      expect(build(:sound, url: nil)).to_not be_valid
    end
  end

  describe 'has a valid factory' do
    it { expect(create(:sound)).to be_valid }
  end
end
