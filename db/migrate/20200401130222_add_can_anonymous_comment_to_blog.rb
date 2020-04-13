class AddCanAnonymousCommentToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :can_anonymous_comment, :boolean
  end
end
