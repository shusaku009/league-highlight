# == Schema Information
#
# Table name: videos
#
#  id            :bigint           not null, primary key
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
FactoryBot.define do
  factory :video do
    team { nil }
  end
end
