class Response < ApplicationRecord
  belongs_to :request
  has_many :response_codes
end
