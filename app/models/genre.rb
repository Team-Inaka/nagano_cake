class Genre < ApplicationRecord
	validates :name, presence: { message: 'ジャンル名を入力してください' }
	validates :is_valid, inclusion: { in: [true, false] }

	has_many :products, dependent: :destroy
end
