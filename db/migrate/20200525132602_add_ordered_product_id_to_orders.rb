class AddOrderedProductIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :ordered_product_id, :integer
  end
end
