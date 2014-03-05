class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        can [:read, :index],  Ad, :state => 'published'
    elsif user.role.admin?
        #can :manage, :all
        can [:read, :destroy, :rejecte, :approve, :transfer_state], Ad
        #cannot [:update, :edit, :create], Ad
        can :set_role, User
        can :manage, User
        can :manage, Type
    elsif user.role.user?
        can [:read, :create, :destroy, :transfer_state, :send_to_pending, :send_to_draft], Ad, :user_id => user.id
        can [:update, :edit], Ad, :user_id => user.id, :state => 'draft'
    end
    #else
        #can :read, :all
    #end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
