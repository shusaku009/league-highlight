require 'rails_helper'

RSpec.describe "チーム", type: :system do
  describe 'チーム作成' do
    it 'チームを作成することができること' do
      visit '/teams/new'
      fill_in 'チーム名', with: 'テストチームです'
      click_on '登録する'
      expect(page).to have_content 'チームの登録が完了しました'
    end
  end

  describe '編集' do
    let!(:team) { create(:team) }
    it '編集ができること' do
      visit "/teams/#{team.id}/edit"
      fill_in 'チーム名', with: 'テストチームです'
      click_on '更新する'
      expect(page).to have_content 'チームの更新が完了しました'
    end
  end

  describe '削除' do
    let(:team) { create(:team) }
    it '削除ができること' do
      visit "/teams/#{team.id}"
      accept_confirm { click_on '削除' }
      expect(page).to have_content '「テストチーム」を削除しました'
    end
  end
end
