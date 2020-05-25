class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
  	Cart.all.each do |cart|
  		sums = cart.cart_items.group(:product_id).sum(:number)
  		sums.each do |product_id, number|
  			if number > 1
  				cart.cart_item.where(product_id: product_id).delete_all
  				cart.cart_item.create(product_id: product_id, number: number)
  			end
  		end
  	end
  end
end
