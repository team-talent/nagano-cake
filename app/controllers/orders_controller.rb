class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    session[:order] = nil
    @destination = Destination.where(customer_id: current_customer)
    @order = Order.new
    @orders = Order.all
  end

  def create
    order = current_customer.orders.new(session[:order])
    order.send_fee = 800
    order.save
    if session[:destination] == nil
      destination = current_customer.destinations.new(
      postcode_tosend: session[:order]["postcode_tosend"],
      address_tosend:  session[:order]["address_tosend"],
      name_tosend:     session[:order]["name_tosend"]
      )
      destination.save
    else
    end

    @cart = Cart.where(customer_id: current_customer)
    @cart.each do |cart|
      Detail.create(
      order_id: order.id,
      product_vol: cart.vol,
      product_price: cart.product.price,
      production_status:0,
      product_id: cart.product.id
      )
    end
    session[:order] = nil
    session[:destination] = nil
    redirect_to homes_thanks_path
  end

  def confirm
    @cart = Cart.where(customer_id: current_customer)
    session[:order] = Order.new()
    if params[:address].to_i == 2
      session[:order][:pay] = params[:pay]
      session[:order][:postcode_tosend] = current_customer.postal_code
      session[:order][:address_tosend]  = current_customer.address
      session[:order][:name_tosend]     = current_customer.last_name + current_customer.first_name
      session[:order][:order_status] = 0
    elsif params[:address].to_i == 3
      destination = current_customer.destinations.find(params[:order][:destination])
      session[:destination] = params[:order][:destination]
      session[:order][:pay] = params[:pay]
      session[:order][:postcode_tosend] = destination.postcode_tosend
      session[:order][:address_tosend]  = destination.address_tosend
      session[:order][:name_tosend]     = destination.name_tosend
      session[:order][:order_status] = 0
    elsif params[:address].to_i == 4
      session[:order] = order_params
      session[:order][:pay] = params[:pay]
      session[:order][:order_status] = 0
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
