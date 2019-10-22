class AddCoverToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :cover, :string
  end
end
