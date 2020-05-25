class CartsController < ApplicationController
	def index
    @carts = current_customer.carts.all
    array = []
    @carts.each do |carts|
      array << carts.product.price * carts.vol
    end
    subtotal = array.sum
    @total = (subtotal * 1.1).round
	end

  def create
    cart = Cart.new(cart_params)
    cart.customer_id = current_customer.id
    cart.save
    redirect_to carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    current_customer.carts.destroy_all
    redirect_to carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:vol, :product_id)
  end
end
