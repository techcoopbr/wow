class DropGame < ActiveRecord::Migration[5.0]
  def change
    drop_table :game_creators
  end
end
