class CreateCreators < ActiveRecord::Migration[5.0]
  def change
    create_table :creators do |t|
      t.references :user, foreign_key: true
      t.boolean :approved, default: false
      t.text :about

      t.timestamps
    end
  end
end
