class ProductsController < ApplicationController
	def index
    @products = Product.all
	end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
  end
end
