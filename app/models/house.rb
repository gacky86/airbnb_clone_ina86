class House < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy

  has_many_attached :photos
end
