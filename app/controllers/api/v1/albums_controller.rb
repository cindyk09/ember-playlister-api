module Api
  module V1
    class AlbumsController < ApplicationController
      def index
        render json: Album.all
      end

      def show
        album = Album.find(params[:id])
        render json: album
      end
    end
  end
end
