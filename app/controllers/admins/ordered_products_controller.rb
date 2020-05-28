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
       redirect_to admins_orders_path
      end
    
      def production_update
        @ordered_product = OrderedProduct.find(params[:id])
        @ordered_product.update(admins_ordered_products_params)
        redirect_to admins_orders_path
      end
    
      private
        def admin_ordered_products_params
          params.require(:order).permit(:order_status)
        end

        def admins_ordered_products_params
          params.require(:ordered_product).permit(:production_status)
        end
end
