class AddHouseToRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :requests, :house, null: false, foreign_key: true
  end
end
