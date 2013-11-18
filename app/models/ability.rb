class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :banned
      can :read, Slog
      can :read, User
    else
      can :read, Slog
      can :show, User
      if user.role?(:author)
        # can :create, Comment
        # can :update, Comment do |comment|
        #   comment.try(:user) == user || user.role?(:moderator)
        # end
        can :autocomplete, Mission
        can :autocomplete_tag_name, Slog
        can :create, Slog
        can :upvote, Slog
        can :flag, Slog
        can :comment, Slog
        can :update, Slog do |slog|
          slog.try(:user) == user
        end
      end
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
