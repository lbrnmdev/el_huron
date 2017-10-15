class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at
  link(:self) { api_v1_user_url(object) }
end
