class EditRequestStatus < ActiveRecord::Migration[7.1]
  def change
    change_column :requests, :status, :string
  end
end
