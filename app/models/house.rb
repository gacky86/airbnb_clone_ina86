class House < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :bookmarks, dependent: :destroy


  has_many_attached :photos

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
