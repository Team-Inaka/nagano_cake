class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :costomer_id
      t.integer :product_id
      t.integer :cart_id
      t.integer :number, default: 1
      t.integer :order_id

      t.timestamps
    end
  end
end
