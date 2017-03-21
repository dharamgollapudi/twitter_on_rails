# :no-doc:
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable
  devise :database_authenticatable,
         :registerable,
         :validatable

  devise :omniauthable, omniauth_providers: [:twitter]

  serialize :oauth_data, Hash

  class << self
    def find_or_create_from_twitter(oauth_data)
      User.where(
        provider: :twitter,
        uid: oauth_data['uid']
      ).first || User.create(
        provider: :twitter,
        uid: oauth_data['uid'],
        token: oauth_data['credentials']['token'],
        secret: oauth_data['credentials']['secret'],
        oauth_data: oauth_data
      )
    end
  end

  def email_required?
    provider.nil?
  end

  def password_required?
    provider.nil?
  end

  def twitter_client
    @twitter_client ||= TwitterClient.new(self)
  end

  def home_timeline
    twitter_client.home_timeline(uid)
  end

  def user_timeline
    twitter_client.user_timeline(uid)
  end

  def following
    twitter_client.following(uid)
  end

  def followers
    twitter_client.followers(uid)
  end

  def favorites
    twitter_client.favorites(uid)
  end
end
