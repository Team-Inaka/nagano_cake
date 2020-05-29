class Product < ApplicationRecord
	validates :name, presence: { message: '商品名を入力してください' }
	validates :notax_price, presence: { message: '税抜価格を入力してください' }
	validates :image, presence: { message: '商品画像を選択してください' }
	validates :genre, presence: { message: 'ジャンルを選択してください' }
	validates :is_valid, inclusion: { in: [true, false] }

	belongs_to :genre
	attachment :image

	has_many :costomers_cart_items
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
