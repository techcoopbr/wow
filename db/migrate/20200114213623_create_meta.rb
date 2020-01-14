class CreateMeta < ActiveRecord::Migration[5.0]
  def change
    create_table :meta do |t|
      t.string :title
      t.string :description
      t.string :photo
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
