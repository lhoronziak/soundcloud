class FavouriteSound < ApplicationRecord
  belongs_to :sound
  belongs_to :user

  validates_uniqueness_of :sound, scope: :user
  validates_presence_of :sound, :user
end
