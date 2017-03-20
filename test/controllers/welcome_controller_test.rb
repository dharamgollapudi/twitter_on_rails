require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should redirect to login page without authentication" do
    get '/'

    assert_redirected_to new_user_session_path
  end

  test "should get index with authentication" do
    sign_in(users(:one))

    get '/'

    assert_response :success
  end
end
