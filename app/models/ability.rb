class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    @user = user || User.new # guest user (not logged in)

    if @user.has_role? :admin
      can :manage, :all
    end
    if @user.has_role? :editor
      can :manage, Product
    end

    if @user.roles.size == 0
      can :read, :all #for guest without roles
    end

  end
end
