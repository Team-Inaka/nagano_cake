class AddFamilyNameKanaToCostomers < ActiveRecord::Migration[5.2]
  def change
    add_column :costomers, :family_name_kana, :string
  end
end
