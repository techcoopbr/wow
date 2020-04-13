class AddPublishersToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :publishers, :string
  end
end
