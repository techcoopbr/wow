class BlogPolicy < ApplicationPolicy
  attr_reader :user, :creator

  def initialize(user, blog)
    @user = user
    @blog = blog
  end

  def update?
    user.admin? || creator.id == user.creator.id
  end

  def index?
    true
  end

  def show?
    user.admin? || creator.id == user.creator.id
  end

  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || creator.id == user.creator.id
  end
end
