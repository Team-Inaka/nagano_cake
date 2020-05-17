class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :delivery_address
      t.integer :pay_method
      t.integer :order_status
      t.string :delivery_zipcode
      t.string :address_name
      t.integer :postage
      t.integer :billing_amount
      t.timestamps
    end
  end
end
