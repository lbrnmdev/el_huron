class TableEntry < ApplicationRecord
  belongs_to :league
  belongs_to :player, class_name: 'User', foreign_key: 'player_id'
  validates_uniqueness_of :player_id, :scope => :league_id, message: "already belongs to this league"
end
