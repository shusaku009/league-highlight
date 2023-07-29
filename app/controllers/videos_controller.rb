class VideosController < ApplicationController
  def index
    @pagy, @videos = pagy(Video.all, items: 24)
  end

  def show
    @video = Video.find(params[:id])
    # 動画に対するコメントを表示
    @pagy, @comments = pagy(@video.comments.order(created_at: :desc), items: 15)
    @comment = Comment.new
  end
end
