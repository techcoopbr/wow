class AddDevelopersToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :developers, :string
  end
end
