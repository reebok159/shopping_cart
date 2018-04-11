module ShoppingCart
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    before_action :last_order
  end
end
