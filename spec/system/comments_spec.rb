require 'rails_helper'

RSpec.describe "コメント", type: :system do
  let!(:user) { create(:user) }
  let!(:video) { FactoryBot.create(:video) }
  before do
    login_as(user)
  end

  describe '作成' do
    it 'コメントが作成できること' do
      visit video_path(video)
      within '#form_comment' do
        fill_in 'コメント', with: 'コメントです'
        click_on '登録する'
      end
      expect(page).to have_content 'コメントです'
    end
  end

  describe '更新' do
    let!(:comment) { create(:comment, video: video, user: user) }
    it 'コメントが更新できること' do
      visit video_path(video)
      within "#comment_#{comment.id}" do
        find('.btn-edit').click
      end
      within "#form_comment_#{comment.id}" do
        fill_in 'コメント', with: '更新コメントです'
        click_on '更新する'
      end
      expect(page).to have_content '更新コメントです'
    end
  end

  describe '削除' do
    let!(:comment) { create(:comment, video: video, user: user) }
    it 'コメントが削除できること' do
      visit video_path(video)
      within "#comment_#{comment.id}" do
        accept_confirm { find('.btn-delete').click }
      end
      expect(page).not_to have_content comment.body
    end
  end

  describe 'ページネーション' do
    let!(:comments) { create_list(:comment, 16, video: video, user: user) }
  
    it '16件目のコメントは1ページ目に表示されていないこと' do
      visit video_path(video)
      expect(page).not_to have_css("#comment_#{comments.first.id}")
    end
  end
end
