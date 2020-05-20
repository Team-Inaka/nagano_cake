class Admins::OrdersController < ApplicationController
    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
        
      end
    
      def update
       @order = Order.find(params[:id])
       @order.update(admin_ordered_products_params)
       redirect_to admin_ordered_product_path(@order)
      end
end
