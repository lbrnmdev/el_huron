class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name
  link(:self) { api_v1_league_url(object) }
  belongs_to :owner, serializer: UserSerializer
end
