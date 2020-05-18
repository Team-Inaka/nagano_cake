class AddMiddleNameToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :middle_name, :string
  end
end
