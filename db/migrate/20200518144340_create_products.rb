class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,null: false
      t.text :explain,null: false
      t.integer :notax_price,null: false
      t.string :image_id,null: false
      t.string :genre_id,null: false
      t.boolean :is_valid,default: true, null: false

      t.timestamps
    end
  end
end
