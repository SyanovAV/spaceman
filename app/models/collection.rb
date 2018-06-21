class Collection < ApplicationRecord
  has_many :requests
  has_many :folder
  validates :name, presence: true,
            length: { minimum: 5 }
end
