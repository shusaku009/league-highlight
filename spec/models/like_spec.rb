# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  video_id   :bigint           not null
#
# Indexes
#
#  index_likes_on_user_id               (user_id)
#  index_likes_on_video_id              (video_id)
#  index_likes_on_video_id_and_user_id  (video_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (video_id => videos.id)
#
require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#like' do
    let!(:user) { create(:user) } 
    let!(:video) { create(:video) }
    it 'いいねできること' do
      expect { user.like(video) }.to change { Like.count }.by(1)
    end
  end

  describe '#unlike' do
    let!(:user) { create(:user) }
    let!(:video) { create(:video) }
    before do
      user.like(video)
    end
    it 'いいねが解除できること' do
      expect { user.unlike(video) }.to change { Like.count }.by(-1)
    end
  end

  describe '#like?' do
    let!(:user) { create(:user) }
    let!(:video) { create(:video) }
    let!(:not_liked_video) { create(:video) }
    before do
      user.like(video)
    end
    it 'いいねしているかどうかを判定できること' do
      expect(user.like?(video)).to be true
      expect(user.like?(not_liked_video)).to be false
    end
  end
end
