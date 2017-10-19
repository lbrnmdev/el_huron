require 'test_helper'
require 'json'

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get valid list of posts" do
    get api_v1_leagues_url
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal 2, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'leagues'
  end
end