class HomesController < ApplicationController
	def home
		@product1 = Product.find(1)
		@product2 = Product.find(2)
		@product3 = Product.find(3)
		@genres = Genre.all
	end

	def thanks

	end

	def about
	end
end
