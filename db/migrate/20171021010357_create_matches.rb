class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references :league, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
