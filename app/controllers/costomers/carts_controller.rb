class Costomers::CartsController < ApplicationController
	before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def show
  end

  def destroy
  	@cart = current_cart
  	@cart.destroy
  	session[:cart_id] = nil
  	redirect_to costomers_products_path, notice: 'カートが空になりました'
  end

private
	def set_cart
		@cart = Cart.find(params[:id])
	end
end
