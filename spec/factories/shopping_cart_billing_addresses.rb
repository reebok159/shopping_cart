FactoryBot.define do
  factory :shopping_cart_billing_address, class: 'ShoppingCart::BillingAddress' do
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
