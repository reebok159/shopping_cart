module ShoppingCart
  module ApplicationHelper
    def price_options
      { unit: '$', format: '%n%u' }
    end
  end
end
