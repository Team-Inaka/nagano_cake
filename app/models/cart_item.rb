class CartItem < ApplicationRecord
	# belongs_to :order
	belongs_to :product
	belongs_to :cart
	validates :number, numericality: { only_integer: true, greater_than: 0 }, presence: true
	def total_price
		product.notax_price * number
	end
end
