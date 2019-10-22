class AddFieldsToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :creator_published, :boolean
    add_column :blogs, :admin_published, :boolean
    add_column :blogs, :short_description, :string
  end
end
