class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.references :owner, index: true, foreign_key: { to_table: :user }

      t.timestamps
    end
    add_index :leagues, :name, unique: true
  end
end
