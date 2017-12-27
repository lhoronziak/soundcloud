require 'rails_helper'

describe Directory, type: :model do
  describe 'validations' do
    it 'is invalid without name' do
      expect(build(:directory, name: nil)).to_not be_valid
    end
  end

  describe 'has a valid factory' do
    it { expect(create(:directory)).to be_valid }
  end
end
