class CreateLeagueCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :league_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
