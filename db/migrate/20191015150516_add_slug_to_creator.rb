class AddSlugToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :slug, :string
  end
end
