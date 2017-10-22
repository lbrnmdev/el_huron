class AddUniqueIndexOnPlayerIdAndLeagueIdToTableEntries < ActiveRecord::Migration[5.1]
  def change
    add_index :table_entries, [:player_id, :user_id], unique: true
  end
end
