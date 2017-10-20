require 'test_helper'
require 'json'

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get valid list of leagues" do
    get api_v1_leagues_url
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal 2, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'leagues'
  end

  test "should get valid league data" do
    league = leagues('league_1')
    get api_v1_league_url(id: league.id)
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal league.id.to_s, jdata['data']['id']
    assert_equal league.name, jdata['data']['attributes']['name']
    assert_equal league.owner.id.to_s, jdata['data']['relationships']['owner']['data']['id']
    assert_equal 'users', jdata['data']['relationships']['owner']['data']['type']
    assert_equal api_v1_league_url(league, { host: "localhost", port: 3000 }), jdata['data']['links']['self']
  end

  test "should get JSON:API error block when requesting league data with invalid ID" do
    skip
  end

  test "creating new league without sending correct content-type should result in error" do
    skip
  end

  test "creating new league with invalid data should result in error" do
    skip
  end

  test "creating new league with valid data should create new league" do
    skip
  end

  test "updating an existing user with valid data should update that user" do
    skip
  end

  test "should delete league" do
    skip
  end
end
