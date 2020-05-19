class HomesController < ApplicationController
	def home
		@products = Product.all
	end
end
