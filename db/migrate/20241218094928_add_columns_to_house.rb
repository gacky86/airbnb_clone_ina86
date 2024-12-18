class AddColumnsToHouse < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :country, :string
    add_column :houses, :city, :string
    add_column :houses, :category, :string
  end
end
