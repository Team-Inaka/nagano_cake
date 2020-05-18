class AddFamilyNameToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :family_name, :string
  end
end
