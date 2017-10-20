class RemoveOwnerFromLeagues < ActiveRecord::Migration[5.1]
  def change
    remove_reference :leagues, :owner, index: true, foreign_key: true
  end
end
