module ShoppingCart
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new

      can :manage, OrderItem, order: { user_id: user.id }
      can %i[create update cart], Order, user: user.id

      return unless user.persisted?
      can :read, Order, user_id: user.id
    end
  end
end
