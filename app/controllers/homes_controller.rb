class HomesController < ApplicationController
	def home
		@products = Product.order("RANDOM()").limit(4)
		@genres = Genre.all
	end

	def thanks
	end

	def about
	end
end
