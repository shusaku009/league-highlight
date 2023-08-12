class Admin::VideosController < Admin::BaseController
  def index
    @q = Video.ransack(params[:q])
    @pagy, @videos = pagy(@q.result(distinct: true), items: 24)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to admin_videos_url, error: "動画「#{@video.title}」を削除しました。"
  end
end
