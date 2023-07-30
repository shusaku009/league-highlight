require 'rails_helper'

RSpec.describe "Likes", type: :system do
  let!(:user) { create(:user) }
  before do
    login_as(user)
  end

  describe '動画の一覧画面のいいねといいねの解除' do
    let!(:video) {create(:video) }
    it 'いいねといいねの解除ができること' do
      visit '/videos'
      expect {
        within "#like_video_#{video.id}" do
          find('.btn-like').click
        end
        sleep 0.1
      }.to change { Like.count }.by(1)

      expect {
        within "#like_video_#{video.id}" do
          find('.btn-unlike').click
        end
        sleep 0.1
      }.to change { Like.count }.by(-1)
    end
  end

  describe '動画の詳細画面のいいねといいねの解除' do
    let!(:video) {create(:video) }
    it 'いいねといいねの解除ができること' do
      visit video_path(video)
      expect {
        within "#like_video_#{video.id}" do
          find('.btn-like').click
        end
        sleep 0.1
      }.to change { Like.count }.by(1)

      expect {
        within "#like_video_#{video.id}" do
          find('.btn-unlike').click
        end
        sleep 0.1
      }.to change { Like.count }.by(-1)
    end
  end
end
