class RemovePublishersFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :publishers, :string
  end
end
