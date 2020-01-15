class CreateCreatorTags < ActiveRecord::Migration[5.0]
  def change
    create_table :creator_tags do |t|
      t.belongs_to :creator, foreign_key: true
      t.belongs_to :tag, foreign_key: true

      t.timestamps
    end
  end
end
