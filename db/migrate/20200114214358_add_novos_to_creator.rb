class AddNovosToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :meta_title, :string
    add_column :creators, :meta_description, :string
    add_column :creators, :meta_photo, :string
    add_column :creators, :script_google, :string
  end
end
