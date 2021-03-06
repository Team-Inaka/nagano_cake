class Admins::GenresController < ApplicationController
	before_action :if_not_admin

	def index
		@genres = Genre.all
    	@genre = Genre.new
	end

	def create
		@genre=Genre.new(genre_params)
		if @genre.save
      		redirect_to admins_genres_path,notice: '新規ジャンルを登録しました'
    	else
      		@genres = Genre.all
      		render 'index'
        end
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
	    @genre = Genre.find(params[:id])
	    if @genre.update(genre_params)
	       redirect_to admins_genres_path,notice: 'ジャンルを編集しました'
	    else
	      render 'edit'
	    end
	end

	private
	def genre_params
      	params.require(:genre).permit(:name, :is_valid)
    end
    #adminコントローラに全部入れたい
    def if_not_admin
    	redirect_to new_admin_session_path unless admin_signed_in?
    end
end
