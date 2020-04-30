require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test "add new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path params: {user: {username: "test", email: "test@test.com", password: "password"}}
      follow_redirect!
    end
    assert_template 'users/show'
  end

end
