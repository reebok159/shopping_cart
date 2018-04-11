module ShoppingCart
  class Coupon < ApplicationRecord
    has_many :orders, dependent: :nullify
  end
end
