class RemoveDevelopersFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :developers, :string
  end
end
