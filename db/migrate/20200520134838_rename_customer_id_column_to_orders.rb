class RenameCustomerIdColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :customer_id, :costomer_id
  end
end
