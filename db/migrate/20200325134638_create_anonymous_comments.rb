class CreateAnonymousComments < ActiveRecord::Migration[5.0]
  def change
    create_table :anonymous_comments do |t|
      t.text :commentary
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
