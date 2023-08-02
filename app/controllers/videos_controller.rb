class VideosController < ApplicationController
  def index
    @teams = Team.all
    @q = Video.ransack(params[:q])
    @pagy, @videos = pagy(@q.result(distinct: true), items: 24)
  end

  def show
    @video = Video.find(params[:id])
    # 動画に対するコメントを表示
    @pagy, @comments = pagy(@video.comments.order(created_at: :desc), items: 15)
    @comment = Comment.new
  end
end
