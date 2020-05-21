class CreateGamePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_publishers do |t|
      t.references :game, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
