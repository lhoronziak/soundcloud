class User < ApplicationRecord
  has_many :favourite_sounds
  has_many :directories
  has_many :sounds, through: :favourite_sounds

  validates_presence_of :username, :encrypted_password
  validates_uniqueness_of :username, allow_blank: false, allow_nil: true
end
