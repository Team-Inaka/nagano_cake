class ProductsController < ApplicationController
	def index
	end

	def show
		@product = Product.find(params[:id])
	end
	
	private
	def product_params
		paarams.require(:product).permit(:name, :notax_price, :image_id. :genre_id, :is_valid)
	end
end
