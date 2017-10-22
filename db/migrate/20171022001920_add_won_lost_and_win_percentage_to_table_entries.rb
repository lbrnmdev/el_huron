class AddWonLostAndWinPercentageToTableEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :table_entries, :won, :integer, :default => 0
    add_column :table_entries, :lost, :integer, :default => 0
    add_column :table_entries, :win_percentage, :decimal, :default => 0.00
  end
end
