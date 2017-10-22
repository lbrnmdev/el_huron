require 'test_helper'

class TableEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "invalid if player league combo already exists" do
    entry_0 = table_entries(:league_0_player_0) # already existing combo of league_0+user_0
    entry_1 = TableEntry.new(league: (leagues(:league_0)), player: (users(:user_0))) # same league+player
    refute entry_1.valid?
    assert_equal entry_1.errors[:player_id], ['already belongs to this league']
  end
end
