class Ability
  include CanCan::Ability

  def initialize(user)
    send("set_role_#{user.try(:role) || :guest}", user)
  end

  def set_role_guest(user)
    can [:read, :index],  Ad, :state => 'published'
  end

  def set_role_user(user)
    can [:read, :create, :destroy, :transfer_state, :send_to_pending, :send_to_draft, :search], Ad, :user_id => user.id
    can [:update, :edit], Ad, :user_id => user.id, :state => 'draft'
    can :destroy, Image
    can [:create, :update, :destroy], Comment, :user_id => user.id
  end

  def set_role_admin(user)
    can [:read, :destroy, :rejecte, :approve, :transfer_state, :search], Ad
    cannot [:update, :edit, :create], Ad
    can :set_role, User
    can :manage, User
    can :manage, Type
    can :manage, Comment
  end
end
