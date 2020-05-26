class CustomersController < ApplicationController
	
	def show
		@customer = current_customer
	end

	def edit_update
		@customer =current_customer
	end

	def customers_update
		@customer = current_customer
		if @customer.update(customer_params)
			redirect_to customers_path
		else
			render :edit_update
		end
	end

	def hide
		
	end
	def hide_update
		@customer = current_customer
		@customer.update(customer_status: true)
		reset_session
		redirect_to root_path
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :tel, :email, :postal_code, :address)
	end
	
end
