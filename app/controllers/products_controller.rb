class ProductsController < ApplicationController
	def index
    @products = Product.all
    @genres = Genre.all
	end

  def show
    @product = Product.find(params[:id])
    @cart = Cart.new
    @genres = Genre.all
  end

  def genre_product_index
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @products = @genre.products.all
  end
end
