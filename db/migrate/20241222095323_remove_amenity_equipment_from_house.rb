class RemoveAmenityEquipmentFromHouse < ActiveRecord::Migration[7.1]
  def change
    remove_column :houses, :amenity, :string
    remove_column :houses, :equipments, :string
  end
end
