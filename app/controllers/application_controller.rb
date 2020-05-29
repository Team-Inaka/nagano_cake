class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admins_admins_homes_path
	  when Costomer
	    root_path
	  end
	end



	def current_cart
		unless Cart.exists?(costomer_id: current_costomer.id)
			@cart = Cart.create(costomer_id: current_costomer.id)
		else
			@cart = Cart.find_by(costomer_id: current_costomer.id)
		end
	end

end
