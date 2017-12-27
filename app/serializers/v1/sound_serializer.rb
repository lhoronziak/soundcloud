module V1
  class SoundSerializer < ActiveModel::Serializer
    attributes :id, :name, :url
  end
end
