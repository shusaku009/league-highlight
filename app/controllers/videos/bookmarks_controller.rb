class Videos::BookmarksController < ApplicationController
  before_action :require_login

  def create
    @video = Video.find(params[:video_id])
    current_user.bookmark(@video)
  end

  def destroy
    @video = Video.find(params[:video_id])
    current_user.unbookmark(@video)
  end
end
