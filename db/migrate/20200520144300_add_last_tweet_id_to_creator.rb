class AddLastTweetIdToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :last_tweet_id, :integer
  end
end
