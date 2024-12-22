class AddColumnsToHouse2 < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :zip_code, :string
    add_column :houses, :street, :string
    add_column :houses, :categories, :string, array: true, default: []
    add_column :houses, :guests_number, :integer
    add_column :houses, :beds_number, :integer
    add_column :houses, :bathroom_number, :integer
    add_column :houses, :features, :string, array: true, default: []
    add_column :houses, :amenity, :string, array: true, default: []
    add_column :houses, :equipments, :string, array: true, default: []
    add_column :houses, :min_accom_days, :integer
    add_column :houses, :checkin_time, :string
    add_column :houses, :checkout_time, :string
    add_column :houses, :pets, :boolean, default: false, null: false
    add_column :houses, :smoking, :boolean, default: false, null: false
    add_column :houses, :party, :boolean, default: false, null: false
    add_column :houses, :other_rule, :string
  end
end
