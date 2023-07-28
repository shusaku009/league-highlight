class ApplicationController < ActionController::Base
  include Pagy::Backend
  add_flash_types :success, :error

  private

  def require_login
    unless logged_in?
      flash[:error] = "ログインが必要です"
      redirect_to login_url
    end
  end
end
