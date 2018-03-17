require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrdersController < ApplicationController
    authorize_resource :order, only: %i[index show]

    def index
      @orders = current_user.orders.completed
                            .select_status(params[:status])
                            .decorate
    end

    def show
      @order = current_user.orders.completed.find(params[:id]).decorate
    end

    def cart
      @order = last_order.decorate
    end

    def activate_coupon
      service = OrderService.new(last_order)
      msg = service.activate_coupon_with_message(coupon_params[:coupon_id])
      redirect_to cart_page_url, flash: { notice: msg }
    end

    private

    def coupon_params
      params.require(:order).permit(:coupon_id)
    end
  end
end
