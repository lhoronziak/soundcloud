class Directory < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Directory'

  has_many :children, class_name: 'Directory', foreign_key: 'parent_id', dependent: :destroy
  has_many :favourite_sounds, dependent: :nullify
  has_many :sounds, through: :favourite_sounds

  validates_presence_of :name, :user
end
