require 'test_helper'
require 'json'

class SessionFlowTestTest < ActionDispatch::IntegrationTest
  test "login timeout and meta/logged-in key test" do
    user = users('user_4')
    # Not logged in, because of timeout
    get api_v1_users_url, params: nil,
        headers: { 'X-Api-Key' => user.auth_token }
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal false, jdata['meta']['logged-in']
    # Log in
    post api_v1_login_url,
         params: {
           data: {
             type: 'sessions',
             attributes: {
               username: user.username,
               password: 'password' }}},
         headers: { 'Content-Type' => 'application/vnd.api+json' },
         as: :json
    assert_response 201
    jdata = JSON.parse response.body
    auth_token = jdata['data']['attributes']['auth-token']
    refute_equal user.auth_token, auth_token
    # Logged in
    get api_v1_users_url, params: nil,
        headers: { 'X-Api-Key' => auth_token }
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal true, jdata['meta']['logged-in']
  end
end