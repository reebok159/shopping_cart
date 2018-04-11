FactoryBot.define do
  factory :coupon, class: 'ShoppingCart::Coupon' do
    name 'Tester'
    min_sum_to_activate 0
    expires DateTime.now + 5.days
    discount 5
    code 'code'
  end
end
