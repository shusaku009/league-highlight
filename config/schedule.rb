ENV.each { |k, v| env(k, v) }
set :output, error: 'log/crontab_error.log', standard: 'log/crontab.log' # 
set :environment, :development

# 毎週日曜日、月曜日、火曜日の朝８時に、YouTube動画を更新
every [:sunday, :monday, :tuesday], at: '8:00 am' do
  runner 'Video.fetch_and_save_videos'
end
