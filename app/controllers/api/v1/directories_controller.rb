module Api
  module V1
    class DirectoriesController < ApplicationController
      before_action :doorkeeper_authorize!

      def index
        current_user_sounds = Sound.where(id: current_user.favourite_sounds.where(directory_id: nil).pluck(:sound_id))
        @root = ::Directory.new(name: 'Root',
                                children: current_user.directories.where(parent_id: nil),
                                sounds: current_user_sounds,
                                user: current_user)
        render json: @root, serializer: ::V1::DirectorySerializer
      end

      def show
        @directory = current_user.directories.find(params[:id])
        render json: @directory, serializer: ::V1::DirectorySerializer
      end

      def create
        @parent = ::Directory.find_by(id: params[:parent_id])
        @directory = ::Directory.create(name: directory_params[:name], parent: @parent, user: current_user)
        render json: @directory, serializer: ::V1::DirectorySerializer, status: :created
      end

      def destroy
        @dir = current_user.directories.find(params[:id])
        @dir.destroy
        render json: {}, status: :ok
      end

      private

      def directory_params
        params.require(:name)
        params.permit(:name, :parent_id)
      end
    end
  end
end
