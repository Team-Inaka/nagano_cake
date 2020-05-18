class ShippingAddress < ApplicationRecord
	validates :zipcode, presence: true
	validates :address, presence: true
	validates :name, presence: true
end
