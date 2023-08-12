class Admin::UsersController < Admin::BaseController
  def index
    @pagy, @users = pagy(User.all, items: 24)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end
end
