require 'test_helper'
require 'json'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "creating new session with valid data should create new session" do
    user = users('user_0')
    post "/api/v1/login", params: {
                    data: {
                      type: 'sessions',
                      attributes: {
                        username: user.username,
                        password: 'password' }}},
                  headers: { "Content-Type": "application/vnd.api+json" },
                  as: :json
    assert_response 201
    jdata = JSON.parse response.body
    refute_equal user.auth_token, jdata['data']['attributes']['auth_token']
  end

  test "should delete session" do
    user = users('user_0')
    delete "/api/v1/logout/#{user.auth_token}"

    assert_response 204
  end

end