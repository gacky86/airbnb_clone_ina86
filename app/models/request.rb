class Request < ApplicationRecord
  belongs_to :user
  belongs_to :house
end
