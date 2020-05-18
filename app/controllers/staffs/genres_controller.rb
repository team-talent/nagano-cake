class Staffs::GenresController < ApplicationController
	def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to staffs_genres_path
	end

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	private
	def genre_params
        params.require(:genre).permit(:category_name, :genre_status)
    end
end
