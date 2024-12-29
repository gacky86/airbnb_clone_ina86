class Request < ApplicationRecord
  belongs_to :user
  belongs_to :house

  VALID_STATUS = ["PENDING", "ACCEPTED", "REJECTED"].freeze

  validates :status, presence: true, inclusion: { in: VALID_STATUS }
end
