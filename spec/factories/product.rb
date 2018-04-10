FactoryBot.define do
  factory :product, class: ShoppingCart.product_class.to_s do
    name { FFaker::Book.title }
    price { rand(1.0..150.0) }
  end
end
