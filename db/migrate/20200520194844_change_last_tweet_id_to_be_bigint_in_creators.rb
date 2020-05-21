class ChangeLastTweetIdToBeBigintInCreators < ActiveRecord::Migration[5.0]
  def change
    change_column :creators, :last_tweet_id, :bigint
  end
end
