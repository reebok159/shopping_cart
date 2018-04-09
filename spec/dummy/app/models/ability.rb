class Ability
  include CanCan::Ability
  def initialize(user)
    can :manage, ShoppingCart::OrderItem, order: { user_id: user.id }
    can %i[create update cart], ShoppingCart::Order, user: user.id

    return unless user.persisted?
    can :read, ShoppingCart::Order, user_id: user.id
    can %i[create update], ShoppingCart::ShippingAddress
    can %i[create update], ShoppingCart::CreditCard
    can %i[create update], ShoppingCart::BillingAddress
  end
end

