require 'test_helper'

class TwitterControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test "should get search" do
    get twitter_search_url
    assert_response :success
  end
end
