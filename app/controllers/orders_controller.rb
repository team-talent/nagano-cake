class OrdersController < ApplicationController
  require 'byebug'
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
    order = current_customer.orders.new(session[:order])
    order.send_fee = 800
    if order.save
      destination = current_customer.destinations.new(
        postcode_tosend: session[:order]["postcode_tosend"],
        address_tosend:  session[:order]["address_tosend"],
        name_tosend:     session[:order]["name_tosend"]
        )
      destination.save
      
      detail = Detail.new
      detail.order_id = order.id
      @cart = Cart.where(customer_id: current_customer)
      @cart.each do |cart|
        detail.product_vol = cart.vol
        detail.product_price = cart.product.price
      end
      detail.save
    else
    end
    redirect_to homes_thanks_path
  end

  def confirm
    @cart = Cart.where(customer_id: current_customer)
    session[:order] = Order.new()
    if params[:address].to_i == 2
      session[:order][:pay] = params[:pay]
      session[:order][:postcode_tosend] = current_customer.postal_code
      session[:order][:address_tosend]  = current_customer.address
      session[:order][:name_tosend]     = current_customer.first_name + current_customer.last_name
    elsif params[:address].to_i == 3

    elsif params[:address].to_i == 4
      session[:order] = order_params
      session[:order][:pay] = params[:pay]
    else
      redirect_to orders_path
    end
    total = 0
      @cart.each do |cart|
      total += cart.product.price * cart.vol
    end
    session[:order][:total_price] = total
    @order = Order.new
  end

  private
  def order_params
    params.require(:order).permit(:name_tosend, :postcode_tosend, :address_tosend)
  end
end
