class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :description
      t.string :about

      t.timestamps
    end
  end
end
