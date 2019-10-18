class CreateGameCreators < ActiveRecord::Migration[5.0]
  def change
    create_table :game_creators do |t|
      t.references :game, foreign_key: true
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
