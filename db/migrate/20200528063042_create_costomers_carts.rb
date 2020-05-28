class CreateCostomersCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :costomers_carts do |t|
      t.integer :costomer_id

      t.timestamps
    end
  end
end
