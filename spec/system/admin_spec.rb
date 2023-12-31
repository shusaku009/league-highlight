require 'rails_helper'

RSpec.describe "Admin", type: :system do
  describe 'ログイン前' do
    context 'ユーザーが管理画面にアクセスする' do
      it 'アクセスが失敗する' do
        visit admin_root_path
        expect(page).to have_content I18n.t('application.require_login')
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログイン後' do
    let(:general_user) { create(:user) }
    let(:admin_user) { create(:user, role: :admin) }

    context '管理者権限のあるユーザーが管理画面にアクセスする' do
      it 'アクセスが成功する' do
        login_as(admin_user)
        visit admin_root_path
        expect(current_path).to eq admin_root_path
      end
    end

    context '管理権限のないユーザーが管理画面にアクセスする' do
      it 'アクセスが失敗する' do
        login_as(general_user)
        visit admin_root_path
        expect(page).to have_content I18n.t('defaults.message.not_authorized')
      end
    end
  end
end