class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password

  has_many :leagues, inverse_of: 'owner'

  # TODO validate format of username eg no spaces
  validates :username, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
  # validates :password, length: { minimum: 6 } FIXME trips up controller tests when present
end
