class CartsController < ApplicationController
  before_action :authenticate_customer!
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
    if current_customer.carts.exists?(product_id: params[:cart][:product_id])
      cart = Cart.find_by(product_id: params[:cart][:product_id])
      cart.increment(:vol, params[:cart][:vol].to_i)
      cart.save
      redirect_to carts_path
    else
      cart = Cart.new(cart_params)
      cart.customer_id = current_customer.id
      if cart.save
        redirect_to carts_path
      else
        @product = Product.find(params[:cart][:product_id])
        @cart = Cart.new
        @genres = Genre.all
        render "products/show"
      end
    end
  end

  def update
    @cart = current_customer.carts.find(params[:id])
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
