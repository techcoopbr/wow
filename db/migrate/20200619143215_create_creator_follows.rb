class CreateCreatorFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :creator_follows do |t|
      t.references :user, foreign_key: true
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
