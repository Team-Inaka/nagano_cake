class Costomers::ProductsController < ApplicationController
	def index
		@genres =  Genre.where(is_valid: true)

	    if params[:genre_id]
	      # Genreのデータベースのテーブルから一致するidを取得
	      @genre = Genre.find(params[:genre_id])
	       
	      # genre_idと紐づく商品を取得
	      @products = @genre.products.all.page(params[:page]).per(8)
	    else
	      # 商品すべてを取得
	      @products = Product.page(params[:page]).per(8)
	    end
	end

	def show
		@genres =  Genre.where(is_valid: true)
		@product = Product.find(params[:id])

		if @product.is_valid == true
			@select_num=[1,2,3,4,5,6,7,8,9,10]
		end

		@producted = CartItem.new

	end
end
