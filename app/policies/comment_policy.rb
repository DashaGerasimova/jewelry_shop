class CommentPolicy < ApplicationPolicy
  def create?
    user
  end

  def new?
    create?
  end

  def update?
    owner? 
  end

  def edit?
    update?
  end

  def destroy?
    owner? || user.admin? || user.manager?
  end
end