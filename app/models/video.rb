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
class Video < ApplicationRecord
  belongs_to :team
  validates :title, presence: true
  validates :video_id, presence: true
  validates :thumbnail_url, presence: true
  # rubocop:disable Metrics/MethodLength
  def self.fetch_and_save_videos(after: 1.year.ago, before: Time.zone.now)
    Team.find_each do |team|
      # YouTubeの動画検索を行う
      opt = {
        q: "#{team.name} + 'ハイライト",
        channel_id: 'UCJ-l-sMQFHogSy8KXRyMIRA',
        type: 'video',
        max_results: 40,
        video_duration: "medium",
        order: 'relevance',
        published_after: after.iso8601,
        published_before: before.iso8601
      }
      response = YoutubeService.list_searches(:snippet, **opt)

      # 動画データを保存する
      response.items.each do |item|
        # カラムに同じvideo.idがすでに存在している場合は保存しない
        Video.find_or_create_by(video_id: item.id.video_id) do |video|
          video.title = item.snippet.title
          video.thumbnail_url = item.snippet.thumbnails.high.url
          video.published_at = item.snippet.published_at
          video.team_id = team.id
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
