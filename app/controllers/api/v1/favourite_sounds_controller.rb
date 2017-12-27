module Api
  module V1
    class FavouriteSoundsController < ApplicationController
      before_action :doorkeeper_authorize!

      def index
        @sounds = current_user.sounds
        render json: @sounds, each_serializer: ::V1::SoundSerializer
      end

      def create
        @sound = Sound.find(favourite_sounds_params[:sound_id])
        FavouriteSound.find_or_create_by(user: current_user, sound: @sound)
        render json: {}, status: :created
      end

      def destroy
        @favourite_sound = current_user.favourite_sounds.find(params[:id])
        @favourite_sound.destroy
        render json: {}, status: :ok
      end

      private

      def favourite_sounds_params
        params.require(:sound_id)
        params.permit(:sound_id)
      end
    end
  end
end
