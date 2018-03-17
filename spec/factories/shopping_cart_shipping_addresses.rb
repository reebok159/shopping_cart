FactoryBot.define do
  factory :shopping_cart_shipping_address, class: 'ShoppingCart::ShippingAddress' do
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    city "MyString"
    zip "MyString"
    country "MyString"
    phone "MyString"
    user_id 1
    billing_a nil
  end
end
