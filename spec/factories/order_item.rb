FactoryBot.define do
  factory :order_item, class: 'ShoppingCart::OrderItem' do
    order
    product nil
    quantity 1
  end
end
