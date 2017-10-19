class League < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  validates :name, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
  validates :owner, presence: true
end
