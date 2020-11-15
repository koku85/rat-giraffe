class ChangeDatatypeColumnsOfProperties < ActiveRecord::Migration[5.2]
  def change
    change_column :properties, :property_name, :string
    change_column :properties, :address, :string
    change_column :properties, :remarks, :text
  end
end
