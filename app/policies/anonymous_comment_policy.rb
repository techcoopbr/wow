class AnonymousCommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    if user
      user.admin? || user.creator == comment.blog.creator
    end

    false
  end

end