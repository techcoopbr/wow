class AddSourceIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :source_id, :int
  end
end
