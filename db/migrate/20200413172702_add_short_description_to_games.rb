class AddShortDescriptionToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :short_description, :string
  end
end
