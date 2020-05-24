module ApplicationHelper

	# 税込金額計算メソッド
	def addTax(price)
		(price*1.1).round
	end

	# 金額など3桁区切りカンマメソッド（1,000とか）
	def add_comma(price)
    	price.to_s(:delimited)
  	end

end
