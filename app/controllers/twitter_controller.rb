# :no-doc:
class TwitterController < ApplicationController
  def search
    if params[:query].present?
      handle = params[:query]
      @tweets = TwitterClient.new.user_timeline(handle)
    end
  end

  def home_timeline
    @tweets = current_user.home_timeline
  end

  def following
    @following = current_user.following
  end
  
  def followers
    @followers = current_user.followers
  end

  def favorites
    @tweets = current_user.favorites
  end  
end
