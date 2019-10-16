class CreatorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    user.admin? || creator.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end
end
