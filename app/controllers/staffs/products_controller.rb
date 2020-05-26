class Staffs::ProductsController < ApplicationController
	before_action :authenticate_staff!
	def new
		@product = Product.new
		@genres = Genre.where(genre_status: true)

	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to staffs_product_path(@product)
		else
			@genres = Genre.where(genre_status: true)
			render :new
		end
	end

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@genre = @product.genre
		@category_name = @genre.category_name
	end

	def edit
		@product = Product.find(params[:id])
		@genres = Genre.where(genre_status: true)
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to staffs_product_path(@product)
		else
			@genres = Genre.where(genre_status: true)
			render :edit
		end
	end

	private
	def product_params
		params.require(:product).permit(:image, :name, :explain, :genre_id, :price, :sale_status)
	end
end
