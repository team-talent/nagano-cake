class DestinationsController < ApplicationController
	before_action :authenticate_customer!
	def index
		@destination = Destination.new
		@destinations = current_customer.destinations.all
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def create
		@destination = Destination.new(destination_params)
		if @destination.save
			redirect_back(fallback_location: root_path)
	  else
	  	@destinations = current_customer.destinations.all
	  	render :index
	  end
	end

	def update
		@destination = Destination.find(params[:id])
		if @destination.update(destination_params)
			redirect_to destinations_path
		else
			render :edit
		end
	end

	def destroy
		@destination = Destination.find(params[:id])
		@destination.destroy
		redirect_back(fallback_location: root_path)
	end

	private

	def destination_params
		params.require(:destination).permit(:customer_id, :postcode_tosend, :address_tosend, :name_tosend)
	end
end
