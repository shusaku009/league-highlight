class VideosController < ApplicationController
  def index
    @pagy, @videos = pagy(Video.all, items: 24)
  end

  def show
    @video = Video.find(params[:id])
    @comments = @video.comments.order(created_at: :desc)
    @comment = Comment.new
  end
end
