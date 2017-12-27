module Api
  module V1
    class SoundsController < ApplicationController
      before_action :doorkeeper_authorize!

      def index
        @sounds = Sound.all
        render json: @sounds, each_serializer: ::V1::SoundSerializer
      end
    end
  end
end
