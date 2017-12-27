class Sound < ApplicationRecord
  validates_presence_of :name, :url
end
