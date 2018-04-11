module ShoppingCart
  class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product, class_name: ShoppingCart.product_class.to_s
  end
end
