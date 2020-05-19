class CustomersController < ApplicationController
	def hide
		
	end
	def hide_update
		@customer = current_customer
		@customer.update(customer_status: true)
		reset_session
		redirect_to root_path
	end
end
