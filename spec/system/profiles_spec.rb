require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end

  describe 'アカウント更新' do
    it 'アカウントを更新できること' do
      find("#header-avatar-dropdown").click
      click_on 'プロフィール編集'
      sleep 1
      expect(current_path).to eq '/profile/edit'
      fill_in 'ユーザー名', with: 'testuser_update'
      fill_in 'メールアドレス', with: 'test_update@example.com'
      attach_file 'user[avatar]', "#{Rails.root}/spec/system/fixtures/avatar.jpg"
      click_on '更新する'
      sleep 1
      user.reload
      expect(user.user_name).to eq 'testuser_update'
      expect(user.email).to eq 'test_update@example.com'
      expect(user.avatar).to be_present
    end
  end
end
