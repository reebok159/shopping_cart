FactoryBot.define do
  factory :credit_card, class: 'ShoppingCart::CreditCard' do
    number { rand(10**15..10**16) }
    name { FFaker::Name.html_safe_last_name }
    expires '01/25'
    cvv { rand(100..999) }
  end
end
