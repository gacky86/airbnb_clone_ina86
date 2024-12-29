class AddIndexToBookmark < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, [:user_id, :house_id], unique: :true
  end
end
