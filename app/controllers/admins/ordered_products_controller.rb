class Admins::OrderedProductsController < ApplicationController
    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
        
      end
    
      def order_update
       @order = Order.find(params[:id])
       @order.update(admin_ordered_products_params)
       redirect_to admin_ordered_product_path(@order)
      end
    
      def production_update
      end
    
      private
        def admin_ordered_products_params
          params.require(:order).permit(:order_status)
        end
end
