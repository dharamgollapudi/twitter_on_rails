class TwitterController < ApplicationController
  def search
    if params[:query].present?
      handle = params[:query]
      @tweets = TwitterClient.search_tweets_by_handle(handle)
    end
  end
end
