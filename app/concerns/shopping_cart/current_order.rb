module ShoppingCart::CurrentOrder
  extend ActiveSupport::Concern
  included do
    helper_method :last_order

    def last_order
      return create_order if current_user.nil?
      current_user.orders.in_progress.first_or_create
    end

    def create_order
      return guest_order if cookies[:order_id] && guest_order.present?
      order = ShoppingCart::Order.create
      cookies.signed[:order_id] = order.id
      order
    end

    def guest_order
      ShoppingCart::Order.find_by(id: cookies.signed[:order_id], status: :in_progress)
    end

    def clear_guest_cookies
      cookies.delete(:save_cart)
      cookies.delete(:order_id)
    end
  end
end
