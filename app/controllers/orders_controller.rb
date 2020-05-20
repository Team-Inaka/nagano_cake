class OrdersController < ApplicationController
    def new
        @order = Order.new
        @costomer = current_costomer 
    end
    
    def create
        @order = Order.new(order_params)
        @order.costomer_id =current_costomer.id
        @order.save
        redirect_to orders_complete_path
    end
    
    def index
      @orders = Order.all
      
    end
    
    def show
      @order = Order.find(params[:id])
    end
    
    def confirm
        @order = Order.new(order_params)
        @order2 = Order.find_by(id: params[:format])
        @ordered_products = OrderedProduct.all
        @order.billing_amount = 0
        @ordered_products.each do |ordered_product|
          @order.billing_amount += (ordered_product.product.notax_price.to_i * ordered_product.number.to_i)
        end
    end
    
    def complete
    end
    
    
    private
        def order_params
            params.require(:order).permit(:costomer_id, :delivery_address, :pay_method, :delivery_zipcode, :address_name, :deliver, :billing_amount)
        end
end
