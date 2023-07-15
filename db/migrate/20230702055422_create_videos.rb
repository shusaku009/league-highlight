class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :team, null: false, foreign_key: true
      t.string :title, null: false
      t.string :video_id, null: false
      t.string :thumbnail_url, null: false

      t.timestamps
    end
  end
end
