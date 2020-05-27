class Staffs::GenresController < ApplicationController
	before_action :authenticate_staff!
	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to staffs_genres_path
		else
			@genres = Genre.all
			render :index
		end
	end

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			redirect_to staffs_genres_path
		else
			render :edit
		end
	end

	private
	def genre_params
        params.require(:genre).permit(:category_name, :genre_status)
    end
end
