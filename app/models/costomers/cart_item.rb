class Costomers::CartItem < ApplicationRecord
	# belongs_to :order
	belongs_to :product
	belongs_to :cart
	def total_price
		product.notax_price * number
	end
end
