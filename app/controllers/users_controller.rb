class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to '/', success: t('.success')
    else
      flash.now[:error] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
