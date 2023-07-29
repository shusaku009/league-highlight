class ApplicationController < ActionController::Base
  include Pagy::Backend
  add_flash_types :success, :error

  private

  def require_login
    return if logged_in?

    flash[:error] = t('application.require_login')
    redirect_to login_url
  end
end
