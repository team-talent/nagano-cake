class HomesController < ApplicationController
	def home
		@products = Product.all
		@genres = Genre.all
	end

	def thanks

	end

	def about
	end
end
