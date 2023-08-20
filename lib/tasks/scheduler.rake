namespace :scheduler do
  desc "YouTubeから動画を取得し、保存する"
  task fetch_and_save_videos: :environment do
    Video.fetch_and_save_videos
  end
end
