class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
  	user.admin? || user == comment.user || user.creator == comment.blog.creator
  end

end