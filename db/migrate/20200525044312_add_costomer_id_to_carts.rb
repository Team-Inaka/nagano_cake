class AddCostomerIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :costomer_id, :integer
  end
end
