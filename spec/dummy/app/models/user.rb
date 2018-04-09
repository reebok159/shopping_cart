class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, class_name: 'ShoppingCart::Order'
  has_one :billing_address, as: :billing_a, class_name: 'ShoppingCart::BillingAddress'
  has_one :shipping_address, as: :shipping_a, class_name: 'ShoppingCart::ShippingAddress'#, foreign_key: :user_id
end
