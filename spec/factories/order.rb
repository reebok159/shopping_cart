FactoryBot.define do
  factory :order, class: 'ShoppingCart::Order' do
    transient do
      product nil
    end

    user nil
    status :in_progress
    checkout_state 'address'

    trait :with_products do
      after(:create) do |order|
        order.order_items << create(:order_item, product: create(:product))
        order.save
      end
    end

    trait :with_given_product do
      after(:create) do |order, evaluator|
        return if evaluator.product.nil?
        order.order_items << create(:order_item, product: evaluator.product)
        order.save
      end
    end
  end
end
