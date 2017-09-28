class OrderPolicy < ApplicationPolicy
  def index?
    user.admin? || user.manager?
  end

  def create?
    user
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.manager?
  end

  def edit?
    update?
  end

  def show?
    user.admin? || user.manager? || owner?
  end

  def destroy?
    user.admin? || user.manager? || owner?
  end
end
