class Staffs::DetailsController < ApplicationController
	def update_for_productionstatus
		@detail = Detail.find(params[:id])
		@detail.update(detail_params)
		redirect_to staffs_orders_path
	end

	private
	def detail_params
	params.require(:detail).permit(:production_status)
	end
end
