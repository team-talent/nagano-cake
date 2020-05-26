class Staffs::HomesController < ApplicationController
  before_action :authenticate_staff!
	def top
		@orders = Order.all
	end
end
