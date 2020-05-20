class UpdateCreatorsTweetJob < ApplicationJob

  def perform
    Creator.start_last_tweet_update
    # puts "Olá Mundo!"
  end
end
