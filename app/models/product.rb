class Product < ApplicationRecord
	validates :name, presence: true
	validates :notax_price, presence: true
	validates :image, presence: true
	validates :genre, presence: true
	validates :is_valid, inclusion: { in: [true, false] }

	belongs_to :genre
	attachment :image

	has_many :cart_items
	before_destroy :referenced_by_cart_item

private
	def referenced_by_cart_item
		if cart_items.empty?
			return true
		else
			errors.add(:base,'品目が存在します。')
			return false
		end
	end

end
