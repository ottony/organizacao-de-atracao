class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Attraction
    can :manage, Attraction, user_id: user.id
  end
end
