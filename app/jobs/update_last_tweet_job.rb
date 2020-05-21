class UpdateLastTweetJob < ApplicationJob
  queue_as :default

  def perform(creator)
    creator.update_last_tweet
  end
end
