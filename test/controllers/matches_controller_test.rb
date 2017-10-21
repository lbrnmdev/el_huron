require 'test_helper'
require 'json'

class MatchesControllerTest < ActionDispatch::IntegrationTest
  test "should get valid list of matches" do
    get api_v1_league_matches_url(leagues(:league_0))
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal 2, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'matches'
  end

  test "should get valid league data" do
    match = matches('match_1')
    get api_v1_league_match_url(match.league, match)
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal match.id.to_s, jdata['data']['id']
    assert_equal match.date.strftime("%F"), jdata['data']['attributes']['date']
    assert_equal match.league.id.to_s, jdata['data']['relationships']['league']['data']['id']
    assert_equal 'leagues', jdata['data']['relationships']['league']['data']['type']
    assert_equal match.winner.id.to_s, jdata['data']['relationships']['winner']['data']['id']
    assert_equal 'winners', jdata['data']['relationships']['winner']['data']['type']
    assert_equal match.loser.id.to_s, jdata['data']['relationships']['loser']['data']['id']
    assert_equal 'losers', jdata['data']['relationships']['loser']['data']['type']
    assert_equal api_v1_league_match_url(match.league, match, { host: "localhost", port: 3000 }), jdata['data']['links']['self']
  end

  test "should get JSON:API error block when requesting match data with invalid ID" do
    skip
  end

  test "creating new match without sending correct content-type should result in error" do
    skip
  end

  test "creating new match with invalid data should result in error" do
    skip
  end

  test "creating new match with valid data should create new league" do
    skip
  end

  test "updating an existing match with valid data should update that match" do
    skip
  end

  test "should delete match" do
    skip
  end
end
