class ApplicationController < ActionController::Base


	def current_cart
		unless Cart.exists?(costomer_id: current_costomer.id)
			@cart = Cart.create(costomer_id: current_costomer.id)
		else
			@cart = Cart.find_by(costomer_id: current_costomer.id)
		end
	end


end