class CartsController < ApplicationController
	def show
    @cart = Cart.find(params[:id])
	end

  def create
    cart = Cart.new(cart_params)
    cart.customer_id = current_customer.id
    cart.product_id = Product.find(params[:id])
    cart.save
    redirect_to cart_path
  end

  private
  def cart_params
    params.require(:cart).permit(:vol)
  end
end
