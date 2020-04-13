class AddCanCommentToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :can_comment, :boolean
  end
end
