class AnonymousCommentPolicy < ApplicationPolicy
  attr_reader :user, :anonymous_comment

  def initialize(user, anonymous_comment)
    @user = user
    @anonymous_comment = anonymous_comment
  end

  def create?
    anonymous_comment.blog.can_anonymous_comment
  end


  def destroy?
    if user
      return user.admin? || user == anonymous_comment.blog.creator.user
    end

    false
  end

end