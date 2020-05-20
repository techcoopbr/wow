class TwitterRestClient < Twitter::REST::Client
  
  def self.new_client
    client = TwitterClient.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      # config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      # config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    client
  end

  def get_last_tweet_id
    client = TwitterClient.newclient
    last_tweet = client.user_timeline(self.twitter, count: 1)
    # retorna objeto do tipo Twitter::Tweet
    last_tweet.first
  end

end