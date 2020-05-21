class AddCreatedAtToOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_products, :created_at, :datetime
    add_column :ordered_products, :updated_at, :datetime
  end
end
