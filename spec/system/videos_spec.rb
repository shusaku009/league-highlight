require 'rails_helper'

RSpec.describe "Videos", type: :system do
  describe '動画のタイトル名での検索' do
    let!(:team) { create(:team, name: 'サンプルチーム')}
    let!(:video_a) { create(:video, title: 'サンプルチーム') }
    let!(:video_b) { create(:video, title: 'カピバラチーム') }
    it '動画のタイトルで検索ができること' do
      visit '/videos'
      find('#team_list').click
      select 'サンプルチーム'
      click_on '検索'
      expect(page).to have_content(video_a.title)
      expect(page).to_not have_content(video_b.title)
    end
  end
end
