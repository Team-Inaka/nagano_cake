class AddAddressToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :address, :string
  end
end
