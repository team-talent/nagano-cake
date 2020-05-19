class CartsController < ApplicationController
	def show
    @carts = current_customer.carts.all
    @cart = Cart.find(params[:id])
    array = []
    @carts.each do |carts|
      array << carts.product.price * carts.vol
    end
    @total = array.sum
	end

  def create
    cart = Cart.new(cart_params)
    cart.customer_id = current_customer.id
    cart.save
    redirect_to cart_path(cart.id)
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_back(fallback_location: root_path)
  end

  def destroy_all
    carts = current_customer.carts.all
    carts.destroy
    redirect_to products_path
  end

  private
  def cart_params
    params.require(:cart).permit(:vol, :product_id)
  end
end
