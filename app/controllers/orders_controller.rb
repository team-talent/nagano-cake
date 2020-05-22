class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    session[:order] = nil
    @order = Order.new
    @orders = Order.all
  end

  def create

  end

  def confirm
    @cart = Cart.where(customer_id: current_customer)
    array = []
      @cart.each do |cart|
      array << cart.product.price * cart.vol
    end
    @total = array.sum

    if params[:address].to_i == 2
      session[:order] = Order.new()
      session[:order][:pay] = params[:pay]
      session[:order][:postcode_tosend] = current_customer.postal_code
      session[:order][:address_tosend]  = current_customer.address
      session[:order][:name_tosend]     = current_customer.first_name + current_customer.last_name
    elsif params[:address].to_i == 3

    else
      session[:order] = order_params
    end
  end

  private
  def order_params
    params.require(:order).permit(:pay, :name_tosend, :postcode_tosend, :address_tosend)
  end
end
