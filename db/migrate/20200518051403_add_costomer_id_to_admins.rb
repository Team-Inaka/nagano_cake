class AddCostomerIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :costomer_id, :integer
  end
end
