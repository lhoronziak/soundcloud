module V1
  class DirectorySerializer < SimpleDirectorySerializer
    attributes :sounds, :children

    def sounds
      ActiveModelSerializers::SerializableResource.new(object.sounds,
                                                      scope: scope,
                                                      each_serializer: ::V1::SoundSerializer)
    end

    def children
      ActiveModelSerializers::SerializableResource.new(object.children,
                                                      scope: scope,
                                                      each_serializer: ::V1::SimpleDirectorySerializer)
    end
  end
end
