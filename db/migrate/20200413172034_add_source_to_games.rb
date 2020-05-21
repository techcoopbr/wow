class AddSourceToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :source, :string
  end
end
