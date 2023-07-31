require 'rails_helper'

RSpec.describe "Bookmarks", type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end

  describe 'お気に入りとお気に入りの解除' do
    let!(:video) {create(:video) }
    it 'お気に入りとお気に入りの解除ができること' do
      visit '/videos'
      expect {
        within "#bookmark_video_#{video.id}" do
          find('.btn-bookmark').click
          # 非同期処理が完了したことを確認する
          expect(page).to have_selector('.btn-unbookmark')
        end
        # sleep 0.1
      }.to change { Bookmark.count }.by(1)

      expect {
        within "#bookmark_video_#{video.id}" do
          find('.btn-unbookmark').click
          # 非同期処理が完了したことを確認する
          expect(page).to have_selector('.btn-bookmark')
        end
        # sleep 0.1
      }.to change { Bookmark.count }.by(-1)
    end
  end

  describe '動画の詳細画面のお気に入りとお気に入りの解除' do
    let!(:video) {create(:video) }
    it 'お気に入りとお気に入りの解除ができること' do
      visit video_path(video)
      expect {
        within "#bookmark_video_#{video.id}" do
          find('.btn-bookmark').click
          # 非同期処理が完了したことを確認する
          expect(page).to have_selector('.btn-unbookmark')
        end
        # sleep 0.1
      }.to change { Bookmark.count }.by(1)

      expect {
        within "#bookmark_video_#{video.id}" do
          find('.btn-unbookmark').click
          expect(page).to have_selector('.btn-bookmark')
        end
        # sleep 0.1
      }.to change { Bookmark.count }.by(-1)
    end
  end
end
