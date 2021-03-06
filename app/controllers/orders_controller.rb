class OrdersController < ApplicationController
    def new
        @order = Order.new
        @costomer = current_costomer 
    end
    
    def create
        @order = Order.new(order_params)
        @order.costomer_id =current_costomer.id
        @order.postage = 0
        @order.save
        @cart_items = CartItem.all
        @cart_items.each do |cart_item|
          ordered_product = OrderedProduct.create(number: cart_item.number,price: cart_item.product.notax_price * 1.10,order_id: @order.id,product_id: cart_item.product_id)
          # number = cart_item no kosuu
          # price = cart_item no Product kara price wo mottekuru
          # order_id = @order.id
          # product_id = cart_item.product_id
          ordered_product.save
        end
        CartItem.destroy_all
        redirect_to orders_complete_path
    end
    
    def index
      @orders = current_costomer.orders
    end
    
    def show
      @order = Order.find(params[:id])
    end
    
    def confirm
        @order = Order.new(order_params)
        @costomer = current_costomer
          render "new" if @order.deliver.nil?
          render "new" if @order.pay_method.nil?

        if @order.deliver == 1
          @ship = ShippingAddress.find(params[:shipping_address_id])
          @order.delivery_zipcode = @ship.zipcode
          @order.delivery_address = @ship.address
          @order.address_name = @ship.name
        elsif @order.deliver == 0
          @address2 = @costomer.zipcode + @costomer.address + @costomer.family_name + @costomer.middle_name
        end

        # elsif @order.deliver == 2
          @ordered_product = OrderedProduct.new
          @order2 = Order.find_by(id: params[:format])
          @cart_items = CartItem.all
          @order.billing_amount = 0
          @cart_items.each do |cart_item|
            @order.billing_amount += ((cart_item.product.notax_price * 1.10).floor.to_i * cart_item.number.to_i)
      
        end
    end
    
    def complete
    end
    
    
    private
        def order_params
            params.require(:order).permit(:costomer_id, :delivery_address, :pay_method, :delivery_zipcode, :address_name, :deliver, :billing_amount, :ordered_product_id)
        end

        def ordered_product_params
            params.permit(:product_id, :production_status, :number, :price, :order_id)
        end
end
