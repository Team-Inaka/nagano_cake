class Costomers::CartItemsController < ApplicationController
	before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
	def create
		@cart = current_cart
		product = Product.find(params[:cart_item][:product_id])
		@cart_item = @cart.cart_items.new(cart_item_params)
		if @cart_item.save
			flash[:notice] = "カートが作成されました"
			redirect_to costomers_cart_path(@cart.id)
		else
			flash[:notice] = "数字を入力してください"
			redirect_to costomers_products_path
		end
	end

	def update
		if @cart_item.update(cart_item_params)
			flash[:notice] = "カートが更新されました"
			redirect_to request.referer
		else
			flash[:notice] = "1以上の数字を入力してください"
			redirect_to request.referer
		end
	end

	def destroy
		if @cart_item.destroy
			flash[:notice] = "商品を削除しました"
			redirect_to request.referer
		else
			redirect_to costomers_products_path
		end
	end

private
	def set_cart_item
		@cart_item = CartItem.find(params[:id])
	end

	def cart_item_params
		params.require(:cart_item).permit(:costomer_id, :product_id, :cart_id, :number)
	end

end
