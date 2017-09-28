class AnswerPolicy < ApplicationPolicy
  def create?
    user.admin? || user.manager?
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

  def destroy?
    user.admin? || user.manager?
  end
end
