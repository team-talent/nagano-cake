class Staffs::SearchesController < ApplicationController
	def search
		@customers = Customer.search(params[:search])
		@products = Product.search(params[:search])
	end

    def Customer.search(search)
	    if search
	      Customer.where(['first_name LIKE ?',"%#{search}%"])
	    else
	      Customer.all
	    end
  	end

	def Product.search(search)
		if search
		Product.where(['name LIKE ?',"%#{search}%"])
		else
		Product.all
		end
	end

end
