class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :delivery_address, null: false
      t.integer :pay_method, null: false
      t.integer :order_status
      t.string :delivery_zipcode, null: false
      t.string :address_name, null: false
      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.timestamps
    end
  end
end
