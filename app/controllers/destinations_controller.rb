class DestinationsController < ApplicationController
	def index
		@destination = Destination.new
		@destinations = Destination.all
	end

	def edit
		@destination = Destination.find(params[:id])
	end

	def create
		@destination = Destination.new(destination_params)
		@destination.save
		redirect_back(fallback_location: root_path)
	end

	def update
		@destination = Destination.find(params[:id])
		@destination.update(destination_params)
		redirect_to destinations_path
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
