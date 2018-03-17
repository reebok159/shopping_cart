module ShoppingCart
  class Order < ApplicationRecord
    include AASM
    belongs_to :user, optional: true, class_name: 'User'

    aasm column: 'checkout_state' do
      state :address, initial: true
      state :delivery
      state :payment
      state :confirm
      state :complete

      event :reset_state do
        transitions to: :address
      end

      event :next_state do
        transitions from: :address, to: :delivery
        transitions from: :delivery, to: :payment
        transitions from: :payment, to: :confirm
        transitions from: :confirm, to: :complete
      end
    end

    belongs_to :delivery_method, optional: true
    belongs_to :coupon, optional: true
    has_one :billing_address, as: :billing_a, dependent: :destroy
    has_one :shipping_address, as: :shipping_a, dependent: :destroy
    accepts_nested_attributes_for :billing_address, allow_destroy: true
    accepts_nested_attributes_for :shipping_address, allow_destroy: true
    has_many :order_items, dependent: :destroy
    has_many :products, through: :order_items

    has_one :credit_card, dependent: :destroy
    accepts_nested_attributes_for :credit_card

    enum status: %i[in_progress in_queue in_delivery delivered canceled]

    scope :completed, -> { where.not(status: :in_progress) }
    scope :select_status, ->(val) { where(status: val) unless val.nil? }

    def total_quantity
      order_items.pluck(:quantity).sum
    end

    def coupon_discount
      coupon.nil? ? 0 : coupon.discount
    end

    def subtotal
      order_items.collect { |item| item.quantity * item.book.price }.sum
    end

    def total_items
      subtotal - coupon_discount
    end

    def pre_total_price
      subtotal + delivery_price - coupon_discount
    end

    def delivery_price
      delivery_method&.cost || 0
    end
  end
end
