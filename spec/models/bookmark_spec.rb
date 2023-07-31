# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  video_id   :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_user_id               (user_id)
#  index_bookmarks_on_video_id              (video_id)
#  index_bookmarks_on_video_id_and_user_id  (video_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (video_id => videos.id)
#
require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe '#bookmark' do
    let!(:user) { create(:user) } 
    let!(:video) { create(:video) }
    it 'お気に入り登録できること' do
      expect { user.bookmark(video) }.to change { Bookmark.count }.by(1)
    end
  end

  describe '#unbookmark' do
    let!(:user) { create(:user) }
    let!(:video) { create(:video) }
    before do
      user.bookmark(video)
    end
    it 'お気に入り登録が解除できること' do
      expect { user.unbookmark(video) }.to change { Bookmark.count }.by(-1)
    end
  end

  describe '#bookmark?' do
    let!(:user) { create(:user) }
    let!(:video) { create(:video) }
    let!(:not_bookmarked_video) { create(:video) }
    before do
      user.bookmark(video)
    end
    it 'お気に入り登録しているかどうかを判定できること' do
      expect(user.bookmark?(video)).to be true
      expect(user.bookmark?(not_bookmarked_video)).to be false
    end
  end
end
