class AddPublishedAtToVideo < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :published_at, :datetime, null: false
  end
end