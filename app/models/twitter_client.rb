# :no-doc:
class TwitterClient
  def initialize(user = nil)
    @user = user
  end

  def native_client
    @native_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret

      if @user.present?
        config.access_token         = @user.token
        config.access_token_secret  = @user.secret
      end
    end
  end

  def home_timeline(uid)
    Rails.cache.fetch("home_timeline_for_#{uid}", expires_in: 5.minutes) do
      native_client.home_timeline
    end
  end

  def user_timeline(handle_or_uid, options)
    # Rails.cache.fetch("user_timeline_for_#{handle_or_uid}", expires_in: 5.minutes) do
    #   console
      native_client.user_timeline(handle_or_uid, options)
    # end
  end

  def following(uid)
    Rails.cache.fetch("following_for_#{uid}", expires_in: 5.minutes) do
      native_client.following
    end
  end

  def followers(uid)
    Rails.cache.fetch("followers_for_#{uid}", expires_in: 5.minutes) do
      native_client.followers
    end
  end

  def favorites(uid)
    Rails.cache.fetch("favorites_for_#{uid}", expires_in: 5.minutes) do
      native_client.favorites
    end
  end
end
