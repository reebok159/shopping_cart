class ProductsController < ApplicationController
  def index; end

  def show
    @book = Product.find(params[:id])
  end
end
