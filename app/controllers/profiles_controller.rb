class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update bookmarks]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('.success', item: User.model_name.human)
    else
      flash.now['error'] = t('.error', item: User.model_name.human)
      render :edit
    end
  end

  def bookmarks
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:video_id)
    @pagy, @bookmark_videos = pagy(Video.where(id: bookmarks), items: 24)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :avatar)
  end
end
