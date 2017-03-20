require 'test_helper'

class TwitterControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @tweets = [
      OpenStruct.new(text: 'SomeText', created_at: Time.now),
      OpenStruct.new(text: 'SomeText', created_at: Time.now)
    ]
  end

  test "should get search" do
    get twitter_search_url
    assert_response :success
  end

  test "should get search with results" do
    TwitterClient.stub(:search_tweets_by_handle, @tweets) do
      get twitter_search_url(query: 'gem')
      assert_response :success
    end
  end
end
