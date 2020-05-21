class ProductsController < ApplicationController
	def index
		@products = Product.page(params[:page]).per(8)
		@genres =  Genre.where(is_valid: true)
	end

	def show

	end
	
end
