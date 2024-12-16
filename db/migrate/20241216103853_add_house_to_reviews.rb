class AddHouseToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :house, null: false, foreign_key: true
  end
end
