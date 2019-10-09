class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo, :string
    add_column :users, :role_id, :string
    add_column :users, :about, :text
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :twitch, :string
    add_column :users, :website, :string
    add_column :users, :podcast, :string
    add_column :users, :page_name, :string
    add_column :users, :page_create, :date
  end
end
