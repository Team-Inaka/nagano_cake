class AddZipcodeToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :zipcode, :string
  end
end
