FactoryBot.define do
  factory :user, class: ShoppingCart.user_class.to_s do
    email 'aabb@hh.de'
    password '12345678'
  end
end
