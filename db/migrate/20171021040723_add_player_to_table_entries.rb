class AddPlayerToTableEntries < ActiveRecord::Migration[5.1]
  def change
    add_reference :table_entries, :player, foreign_key: {to_table: :users}
  end
end
