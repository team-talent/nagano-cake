class Staffs::SearchesController < ApplicationController
	before_action :authenticate_staff!
	def search
		@customers = Customer.search(params[:search])
		@products = Product.search(params[:search])
	end

    def Customer.search(search)
	    if search
	      Customer.where(['last_name LIKE ? OR first_name LIKE ? OR email LIKE ?',"%#{search}%","%#{search}%","%#{search}%"])
	    else
	      Customer.all
	    end
  	end

	def Product.search(search)
		if search
		Product.where(['name LIKE ? OR explain LIKE ?',"%#{search}%","%#{search}%"])
		else
		Product.all
		end
	end

end
