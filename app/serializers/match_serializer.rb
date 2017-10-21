class MatchSerializer < ActiveModel::Serializer
  attributes :id, :date
  link(:self) { api_v1_league_match_url(object.league, object) }
  link(:league) { api_v1_league_url(object.league) }
  link(:winner) { api_v1_user_url(object.winner) }
  link(:loser) { api_v1_user_url(object.loser) }
  belongs_to :league, serializer: LeagueSerializer
  belongs_to :winner, serializer: UserSerializer
  belongs_to :loser, serializer: UserSerializer

  # TODO create methods to return more detailed league, winner and loser info
  # as attributes 
end
