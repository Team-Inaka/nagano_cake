class ShippingAddress < ApplicationRecord
	belongs_to :costomer
	validates :zipcode, presence: true
	validates :address, presence: true
	validates :name, presence: true
end
