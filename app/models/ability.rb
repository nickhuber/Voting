class Ability
  include CanCan::Ability

  def initialize(user)
    # If anon user, create a "guest" user.
    user ||= User.new
    
    # Admin
    if user.role? :admin
      can :manage, :all
      
    # Pollster
    elsif user.role? :pollster
      can :manage, Poll
      can :manage, Question
      can :manage, Report
      can :read, :all

    # Anonymous
    else
      # No anonymous access to anything other than active poll.
      can :read, :active_poll
      
    end
  end
end