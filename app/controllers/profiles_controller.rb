class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profiles_path, success: t('dafaults.message.updated', item: User.model_name.human)
    else
      flash.now['error'] = t('dafaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def show; end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :avatar)
  end
end
