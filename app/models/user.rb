class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password

  has_many :owned_leagues, class_name: 'Transaction', inverse_of: 'owner'
  has_many :matches, inverse_of: 'winner'
  has_many :matches, inverse_of: 'loser'
  has_many :table_entries, inverse_of: 'player'
  has_many :leagues, through: :table_entries

  # TODO validate format of username eg no spaces
  validates :username, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
  # validates :password, length: { minimum: 6 } FIXME trips up controller tests when present
end
