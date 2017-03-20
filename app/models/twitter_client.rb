require 'minitest/mock'

class TwitterClient

  class << self
    def search_tweets_by_handle(handle)
      Rails.cache.fetch("tweets_for_#{handle}", expires_in: 5.minutes) do
        native_client.user_timeline(handle)
      end
    end

    def native_client
      @@native_client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.secrets.twitter_consumer_key
        config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
      end
    end
  end
end