class AddCanAnonymousToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :can_anonymous, :boolean
  end
end
