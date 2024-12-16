class Request < ApplicationRecord
  belongs_to :user
  belongs_to :house
  has_many :reviews, dependent: :destroy
end
