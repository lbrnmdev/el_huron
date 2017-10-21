class AddWinnerAndLoserToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :winner, foreign_key: {to_table: :firms}
    add_reference :matches, :loser, foreign_key: {to_table: :firms}
  end
end
