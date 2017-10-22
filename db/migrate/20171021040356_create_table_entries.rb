class CreateTableEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :table_entries do |t|
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
