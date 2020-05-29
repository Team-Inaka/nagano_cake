class Admins::ProductsController < ApplicationController
	before_action :if_not_admin

	def index
		@products = Product.page(params[:page]).per(10)
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	    if @product.save
	    	redirect_to [:admins, @product],notice: '新規商品を登録しました'
	    else
	    	render :new
	    end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
	    if @product.update(product_params)
	       redirect_to admins_product_path(@product),notice: '商品情報を編集しました'
	    else
	      render :edit
	    end
	end

	private
    def product_params
        params.require(:product).permit(:name, :explain, :notax_price,:image,:genre_id,:is_valid)
    end

    #adminコントローラに全部入れたい
    def if_not_admin
    	redirect_to new_admin_session_path unless admin_signed_in?
    end

end