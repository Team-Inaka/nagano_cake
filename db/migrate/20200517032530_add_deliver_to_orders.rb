class AddDeliverToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :deliver, :integer, null: false, default: "0"
  end
end
