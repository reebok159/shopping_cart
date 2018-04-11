require_dependency "shopping_cart/application_controller"

module ShoppingCart
  class OrderItemsController < ApplicationController
    authorize_resource

    def create
      item = last_order.order_items.find_by(product_id: filtered_params[:product_id])
      if item
        item.increment(:quantity, filtered_params[:quantity])
      else
        item = last_order.order_items.build(filtered_params)
      end
      flash[:notice] = item.save ? t('order_item.create_success') : t('order_item.create_fail')
      redirect_back(fallback_location: cart_page_path)
    end

    def update
      item = last_order.order_items.find_by(id: params[:id])
      flash[:alert] = t('order_item.update_fail') unless item&.update_attributes(filtered_params)
      redirect_back(fallback_location: cart_page_path)
    end

    def destroy
      cart = last_order.order_items
      cart.destroy(params[:id]) if cart.exists?(params[:id])
      redirect_back(fallback_location: cart_page_path)
    end

    private

    def quantity_param
      order_item_params[:quantity].to_i <= 0 ? 1 : order_item_params[:quantity].to_i
    end

    def filtered_params
      order_item_params.merge(quantity: quantity_param)
    end

    def order_item_params
      params.require(:order_item).permit(:id, :product_id, :quantity)
    end
  end
end
