class OrdersController < ApplicationController
    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @order.save
        redirect_to orders_complete_path
    end

    def index
    end

    def show
    end

    def confirm
        @order = Order.new(order_params)
    end

    def complete
    end


    private
        def order_params
            params.require(:order).permit(:delivery_address, :pay_method, :delivery_zipcode, :address_name)
        end
end
