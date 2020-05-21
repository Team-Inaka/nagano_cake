class ShippingAddressesController < ApplicationController
		before_action :authenticate_costomer!
	def index
		@shipping_addresses = current_costomer.shipping_addresses
		@shipping_address = ShippingAddress.new
	end

	def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.costomer_id = current_costomer.id
		if @shipping_address.save
			flash[:notice] = "shipping_address was successfully created."
			redirect_to shipping_addresses_path
		else
			@shipping_addresses = ShippingAddress.all
			render "index"
		end
	end

	def update
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_address.costomer_id = current_costomer.id
		if @shipping_address.update(shipping_address_params)
			flash[:notice] = "shipping_address was successfully updated."
			redirect_to shipping_addresses_path
		else
			render "edit"
		end
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def destroy
		@shipping_address = ShippingAddress.find(params[:id])

		if @shipping_address.destroy
		    flash[:notice] = "shipping_address was successfully destroyed."
			redirect_to shipping_addresses_path
		else
			@shipping_addresses = ShippingAddress.all
			render "index"
		end
	end

 private

    def shipping_address_params
        params.require(:shipping_address).permit(:costomer_id, :zipcode, :name, :address)
    end

end
