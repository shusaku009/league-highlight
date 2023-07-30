class Videos::LikesController < ApplicationController
  before_action :require_login

  def create
    @video = Video.find(params[:video_id])
    current_user.like(@video)
  end
  
  def destroy
    @video = Video.find(params[:video_id])
    current_user.unlike(@video)
  end
end
