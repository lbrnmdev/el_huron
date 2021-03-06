class League < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :matches
  has_many :table_entries
  has_many :leagues, through: :table_entries

  validates :name, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
  validates :owner, presence: true
end
