class AddWinnerAndLoserToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :winner, foreign_key: {to_table: :users}
    add_reference :matches, :loser, foreign_key: {to_table: :users}
  end
end
