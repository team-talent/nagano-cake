class HomesController < ApplicationController
	def home
		@products = Product.order("RANDOM()").all
		@genres = Genre.all
	end

	def thanks
	end

	def about
	end
end
