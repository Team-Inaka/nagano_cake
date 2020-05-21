class Product < ApplicationRecord
	validates :name, presence: true
	validates :notax_price, presence: true
	validates :image, presence: true
	validates :genre, presence: true
	validates :is_valid, inclusion: { in: [true, false] }

	belongs_to :genre
	attachment :image
end
