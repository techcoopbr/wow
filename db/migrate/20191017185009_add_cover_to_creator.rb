class AddCoverToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :cover, :string
  end
end
