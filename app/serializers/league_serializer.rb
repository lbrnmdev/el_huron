class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name
  link(:self) { api_v1_league_url(object) }
  belongs_to :owner, serializer: UserSerializer
  has_many :matches, serializer: MatchSerializer

  # TODO create methods to return more detailed owner and matches info
  # as attributes
end
