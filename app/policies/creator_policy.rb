class CreatorPolicy
  attr_reader :user, :creator

  def initialize(user, creator)
    @user = user
    @creator = creator
  end

  def update?
    user.admin? || creator.user_id == user.id
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || creator.user_id == user.id
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
    user.admin? 
  end
end
