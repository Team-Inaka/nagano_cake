class CartItem < ApplicationRecord

	validates :number, numericality: { only_integer: true, greater_than: 0 }, presence: true
	belongs_to :product, optional: true
	belongs_to :cart, optional: true
	belongs_to :order, optional: true

	def total_price
		product.notax_price * number
	end
end
