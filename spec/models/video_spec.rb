# == Schema Information
#
# Table name: videos
#
#  id            :bigint           not null, primary key
#  published_at  :datetime         not null
#  thumbnail_url :string(255)      not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  team_id       :bigint           not null
#  video_id      :string(255)      not null
#
# Indexes
#
#  index_videos_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_...  (team_id => teams.id)
#
require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'バリデーションテスト' do
    let(:video) { FactoryBot.create(:video) }

    it "動画保存に必要な情報がある場合" do
      video = FactoryBot.build(:video)
      expect(video).to be_valid
    end
  end
end
