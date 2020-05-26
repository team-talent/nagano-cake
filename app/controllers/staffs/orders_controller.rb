class Staffs::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def show_individual
		@order = Order.find(params[:id])
	end

	def update_for_orderstatus
		@order = Order.find(params[:id])
		@order.update(order_params)
		if @order.order_status == "入金確認"
			@details = Detail.where(order_id: @order.id)
			@details.each do |detail|
				detail.update(production_status: "制作待ち")
			end
		end

		@orders = Order.all
		render :index
	end

	def update_for_orderstatus_individual
		@order = Order.find(params[:id])
		@order.update(order_params)
		if @order.order_status == "入金確認"
			@details = Detail.where(order_id: @order.id)
			@details.each do |detail|
				detail.update(production_status: "制作待ち")
			end
		end

		@orders = Order.all
		redirect_to customer_orders_staffs_customer_path(@order.customer_id)
	end

	def index_today
		@orders = Order.all
	end

	private
	def order_params
	params.require(:order).permit(:order_status)
	end
end
