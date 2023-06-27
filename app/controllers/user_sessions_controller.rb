class UserSessionsController < ApplicationController
  def new; end

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_back_or_to '/', success: t('.success')
    else
      flash.now[:error] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, success: t('.success'), stauts: :see_other
  end
end
