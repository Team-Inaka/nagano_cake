class AddMiddleNameKanaToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :middle_name_kana, :string
  end
end
