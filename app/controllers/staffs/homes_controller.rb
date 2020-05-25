class Staffs::HomesController < ApplicationController
	def top
		@order_count = Order.all.count
	end
end
