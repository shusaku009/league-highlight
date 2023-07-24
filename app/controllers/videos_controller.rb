class VideosController < ApplicationController
  def index
    @pagy, @videos = pagy(Video.all, items: 24)
  end

  def show
    @video = Video.find(params[:id])
  end
end
