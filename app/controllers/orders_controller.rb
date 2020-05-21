class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    if params[:radio_button].to_i == 0
      session[:order][:postcode_tosend] = current_customer.postal_code
      session[:order][:address_tosend]  = current_customer.address
      session[:order][:name_tosend]     = current_customer.first_name + current_customer.last_name
    elsif params[:radio_button].to_i == 1
      @order = Order.new(order_params)
    else
      @order = Order.new(order_params)
    end
  end

  private
  def order_params
    params.require(:order).permit(:pay, :name_tosend, :postcode_tosend, :address_tosend)
  end
end
