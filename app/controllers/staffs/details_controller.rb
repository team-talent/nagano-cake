class Staffs::DetailsController < ApplicationController
	before_action :authenticate_staff!
	def update_for_productionstatus
		@detail = Detail.find(params[:id])
		@detail.update(detail_params)

		@order = Order.where(id: @detail.order_id)
		@details = Detail.where(order_id: @detail.order_id)

		if @details.pluck(:production_status).include?("製作中")
			@order.update(order_status: "製作中")

		elsif @details.pluck(:production_status).uniq == ["制作完了"]
			@order.update(order_status: "発送準備中")

		end

		redirect_to staffs_orders_path
	end

	def update_for_productionstatus_individual
		@detail = Detail.find(params[:id])
		@detail.update(detail_params)

		@order = Order.where(id: @detail.order_id)
		@details = Detail.where(order_id: @detail.order_id)

		if @details.pluck(:production_status).include?("製作中")
			@order.update(order_status: "製作中")

		elsif @details.pluck(:production_status).uniq == ["制作完了"]
			@order.update(order_status: "発送準備中")

		end

		redirect_to customer_orders_staffs_customer_path(@detail.order.customer_id)
	end

	private
	def detail_params
	params.require(:detail).permit(:production_status)
	end
end
