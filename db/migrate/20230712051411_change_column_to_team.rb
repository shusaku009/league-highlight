class ChangeColumnToTeam < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :teams, :league_categories
    remove_index :teams, :league_category_id
    remove_reference :teams, :league_category
  end
end
