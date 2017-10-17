# naming this 'Sesh' to avoid confusion with 'SessionSerializer' normally present in rails middleware
class SeshSerializer < ActiveModel::Serializer
  attributes :id, :username, :auth_token
end