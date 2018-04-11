require 'ffaker'

def generate_book
  b = Product.create!(
    name: FFaker::Book.title,
    price: rand(1.0..99.00).round(2),
  )
end

def create_coupon(name = "Test", code = "test-coupon")
  ShoppingCart::Coupon.create(
    name: name,
    min_sum_to_activate: 0,
    discount: rand(1...5),
    code: code,
    expires: Time.now + 365.days
  )
end

def create_delivery_methods
  delivery_methods = [
    { name: 'Pick Up In-Store', delay: '5 to 20 days', cost: 13 },
    { name: 'Delivery Next Day!', delay: '3 to 7 days', cost: 15 },
    { name: 'Expressit', delay: '2 to 3 days', cost: 20 }
  ]
  delivery_methods.each do |item|
    ShoppingCart::DeliveryMethod.create!(item)
  end
end

5.times { generate_book }
create_coupon("New year coupon", "zzafg-8")
create_delivery_methods
