class AddUserToLeagues < ActiveRecord::Migration[5.1]
  def change
    add_reference :leagues, :user, foreign_key: true
  end
end
