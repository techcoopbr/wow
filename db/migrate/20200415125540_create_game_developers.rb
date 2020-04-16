class CreateGameDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_developers do |t|
      t.references :game, foreign_key: true
      t.references :developer, foreign_key: true

      t.timestamps
    end
  end
end
