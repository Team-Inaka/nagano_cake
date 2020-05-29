class AddPhoneNumberToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :phone_number, :string
  end
end
