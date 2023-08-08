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

  def guest_login
    # ゲストユーザーが複数存在する場合は最初に作成したユーザーにログインする
    @guest_user = User.where(user_name: 'ゲスト').first_or_create do |user|
      user.email = "#{SecureRandom.alphanumeric(10)}@email.com"
      user.password = 'password'
      user.password_confirmation = 'password'
      user.role = 0 # 管理者か一般ユーザーなのか判断
    end

    auto_login(@guest_user)
    redirect_to root_path, success: 'ゲストとしてログインしました'
  end
end
