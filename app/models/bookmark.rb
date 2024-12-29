class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :house
  validates :user_id, uniqueness: { scope: :house_id }
  # A user can make bookmark on one house only one time
end
