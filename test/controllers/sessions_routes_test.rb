require 'test_helper'

class SessionsRoutesTest < ActionController::TestCase
  # test "should route to create session" do
  #   assert_routing({ method: 'post', path: '/sessions' },
  #                  { controller: "sessions", action: "create" })
  # end
  # test "should route to delete session" do
  #   assert_routing({ method: 'delete', path: '/sessions/something'},
  #                  { controller: "sessions", action: "destroy", id: "something" })
  # end

  test "should route to api v1 create session" do
    assert_routing({ method: 'post', path: '/api/v1/login' },
                   { controller: "api/v1/sessions", action: "create" })
  end
  test "should route to api v1 delete session" do
    assert_routing({ method: 'delete', path: '/api/v1/logout/something'},
                   { controller: "api/v1/sessions", action: "destroy", id: "something" })
  end
end