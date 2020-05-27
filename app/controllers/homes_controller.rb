class HomesController < ApplicationController
	def top
		@genres =  Genre.where(is_valid: true)
		@products = Product.first(4)
		# オススメ商品（先頭から4つ取っただけの手抜き）
	end
end
