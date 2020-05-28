class CartItem < ApplicationRecord
	# belongs_to :order
	belongs_to :product, optional: true
	belongs_to :cart, optional: true
	belongs_to :order, optional: true
	def total_price
		product.notax_price * number
	end
end
