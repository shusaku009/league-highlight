# 毎週日曜日、月曜日、火曜日の朝８時に、YouTube動画を更新
every [:sunday, :monday, :tuesday], at: '8:00 am' do
  runner "fetch_and_save_videos"
end
