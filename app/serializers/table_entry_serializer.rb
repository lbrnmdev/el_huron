class TableEntrySerializer < ActiveModel::Serializer
  attributes :id # TODO add in won, lost and win_percentage
  link(:self) { api_v1_table_entry_url(object) }
  belongs_to :league, serializer: LeagueSerializer
  belongs_to :player, serializer: UserSerializer

  # TODO create methods to return more detailed owner and matches info
  # as attributes
end
