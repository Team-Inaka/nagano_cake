class AddIsWithdrawToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :is_withdraw, :boolean,default: false
  end
end
