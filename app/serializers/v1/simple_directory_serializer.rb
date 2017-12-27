module V1
  class SimpleDirectorySerializer < ActiveModel::Serializer
    attributes :id, :name, :parent_id
  end
end
