module Api
  module V1
    module Directories
      class FavouriteSoundsController < ApplicationController
        before_action :doorkeeper_authorize!

        def create
          @directory = current_user.directories.find(directory_params[:directory_id])
          @fs = current_user.favourite_sounds.find(directory_params[:favourite_sound_id])
          @fs.update(directory_id: @directory.id)
          render json: @directory, serializer: ::V1::DirectorySerializer, status: :created
        end

        def destroy
          @directory = current_user.directories.find(directory_params[:directory_id])
          @directory.favourite_sounds.find(directory_params[:favourite_sound_id]).update(directory_id: nil)
          render json: @directory, serializer: ::V1::DirectorySerializer, status: :ok
        end

        private

        def directory_params
          params.require(:favourite_sound_id)
          params.permit(:directory_id, :favourite_sound_id)
        end
      end
    end
  end
end
