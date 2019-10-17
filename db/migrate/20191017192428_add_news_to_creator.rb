class AddNewsToCreator < ActiveRecord::Migration[5.0]
  def change
    add_column :creators, :linkdin, :string
    add_column :creators, :photo, :string
    add_column :creators, :facebook, :string
    add_column :creators, :twitter, :string
    add_column :creators, :twitch, :string
    add_column :creators, :website, :string
    add_column :creators, :podcast, :string
    add_column :creators, :page_name, :string
    add_column :creators, :page_create, :date
    add_column :creators, :youtube, :string
    add_column :creators, :instagram, :string    
  end
end
