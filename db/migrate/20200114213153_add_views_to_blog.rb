class AddViewsToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :views, :integer
  end
end
