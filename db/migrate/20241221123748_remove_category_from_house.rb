class RemoveCategoryFromHouse < ActiveRecord::Migration[7.1]
  def change
    remove_column :houses, :category, :string
  end
end
