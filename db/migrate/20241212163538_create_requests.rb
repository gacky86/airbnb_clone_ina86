class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :status

      t.timestamps
    end
  end
end
