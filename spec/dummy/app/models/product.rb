class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy, class_name: 'ShoppingCart::OrderItems'
  has_many :orders, through: :order_items, class_name: 'ShoppingCart::Orders'
end
