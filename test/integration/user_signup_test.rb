require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "get new user form and signup user" do
    get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "johndoe", email: "johndoe@example.com", password: "password" } }
    end
    follow_redirect!
    assert_response :success
    assert_match "successfully signed up", response.body
  end

end
