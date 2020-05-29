class Admins::OrdersController < ApplicationController
  before_action :if_not_admin
    def index
        @orders = Order.all
        @total_number = 0
      end
    
      def show
        @order = Order.find(params[:id])
        
      end
    
      def update
       @order = Order.find(params[:id])
       @order.update(admin_ordered_products_params)
       redirect_to admins_ordered_products_path
      end

      private
      def admin_ordered_products_params
        params.require(:order).permit(:order_status)
      end

      def if_not_admin
        redirect_to new_admin_session_path unless admin_signed_in?
      end

end
