class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer_id
      t.string :zipcode
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
