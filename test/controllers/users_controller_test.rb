require 'test_helper'
require 'json'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "Should get valid list of users" do
    get api_v1_users_url
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal 5, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'users'
  end

  test "Should get valid user data" do
    user = users('user_1')
    get api_v1_user_url(id: user.id)
    assert_response :success
    jdata = JSON.parse response.body
    assert_equal user.id.to_s, jdata['data']['id']
    assert_equal user.username, jdata['data']['attributes']['username']
    assert_equal api_v1_user_url(user, { host: "localhost", port: 3000 }), jdata['data']['links']['self']
  end

  test "Should get JSON:API error block when requesting user data with invalid ID" do
    get api_v1_user_url(id: 'z')
    assert_response 404
    jdata = JSON.parse response.body
    assert_equal "Wrong ID provided", jdata['errors'][0]['detail']
    assert_equal '/data/attributes/id', jdata['errors'][0]['source']['pointer']
  end

  test "Creating new user without sending correct content-type should result in error" do
    post api_v1_users_url, params: {}
    assert_response 406
  end

  test "Creating new user without sending X-Api-Key should result in error" do
    post api_v1_users_url, params: {}, headers: { "Content-Type": "application/vnd.api+json" }
    assert_response 403
  end

  test "Creating new user with invalid type in JSON data should result in error" do
    user = users('user_1')
    post api_v1_users_url, params: { data: { type: 'posts' }},
                          headers: { "Content-Type": "application/vnd.api+json", "X-Api-Key": user.auth_token },
                          as: :json
    assert_response 409
  end

  test "Creating new user with invalid data should result in error" do
    user = users('user_1')
    post "/api/v1/users", params: {
                              data: {
                                type: 'users',
                                attributes: {
                                  username: nil,
                                  password: nil,
                                  password_confirmation: nil }}},
                          headers: { "Content-Type": "application/vnd.api+json", "X-Api-Key": user.auth_token },
                          as: :json
    assert_response 422
    jdata = JSON.parse response.body
    pointers = jdata['errors'].collect { |e|
      e['source']['pointer'].split('/').last
    }.sort
    assert_equal ['password','username'], pointers
  end

  test "Creating new user with valid data should create new user" do
    user = users('user_1')
    post api_v1_users_url, params: {
                            data: {
                              type: 'users',
                              attributes: {
                                username: 'UserNumber7',
                                password: 'password',
                                password_confirmation: 'password' }}},
                          headers: { "Content-Type": "application/vnd.api+json", "X-Api-Key": user.auth_token },
                          as: :json
    assert_response 201
    jdata = JSON.parse response.body
    assert_equal 'UserNumber7',
                 jdata['data']['attributes']['username']
  end

  test "Updating an existing user with valid data should update that user" do
    user = users('user_1')
    patch api_v1_user_url(id: user.id), params: {
                     id: user.id,
                     data: {
                       id: user.id,
                       type: 'users',
                       attributes: { username: 'UserNumber1a' }}},
                  headers: { "Content-Type": "application/vnd.api+json", "X-Api-Key": user.auth_token },
                  as: :json
    assert_response 200
    jdata = JSON.parse response.body
    assert_equal 'UserNumber1a', jdata['data']['attributes']['username']
  end

  test "Should delete user" do
    user = users('user_1')
    ucount = User.count - 1
    # TODO modify so only user can only delete own account
    delete api_v1_user_url(id: user.id), params: { id: users('user_4').id },
                      headers: { "X-Api-Key": user.auth_token }
    assert_response 204
    assert_equal ucount, User.count
  end
end
