class Staffs::ProductsController < ApplicationController

	def new
		@product = Product.new
		@genres = Genre.where(genre_status: true)

	end

	def create
		product = Product.new(product_params)
		product.save
		redirect_to staffs_products_path
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
		@product.update(product_params)
		redirect_to staffs_product_path(@product)
	end

	private
	def product_params
		params.require(:product).permit(:image, :name, :explain, :genre_id, :price, :sale_status)
	end
end
