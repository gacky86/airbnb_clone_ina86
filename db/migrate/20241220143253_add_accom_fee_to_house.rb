class AddAccomFeeToHouse < ActiveRecord::Migration[7.1]
  def change
    add_column :houses, :accom_fee, :integer
  end
end
