class Genre < ApplicationRecord
	validates :name, presence: true
	validates :is_valid, inclusion: { in: [true, false] }

	has_many :products, dependent: :destroy
end
