module Api
  module V1
    class SongsController < ApplicationController
      def index
        render json: Song.all
      end

      def show
        song = Song.find(params[:id])
        render json: song
      end
    end
  end
end
