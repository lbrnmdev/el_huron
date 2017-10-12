class User < ApplicationRecord
  has_secure_token :auth_token
  has_secure_password

  validates :username, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
end
