class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.references :creator, foreign_key: true
      t.string :tags

      t.timestamps
    end
  end
end
