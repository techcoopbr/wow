class CreatePlataforms < ActiveRecord::Migration[5.0]
  def change
    create_table :plataforms do |t|
      t.string :name
      t.string :description
      t.text :about
      t.string :photo

      t.timestamps
    end
  end
end
