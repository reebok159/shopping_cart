FactoryBot.define do
  factory :delivery_method, class: 'ShoppingCart::DeliveryMethod' do
    name 'Pick Up In-Store'
    delay '5 to 20 days'
    cost 13
  end
end
