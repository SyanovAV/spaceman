class Folder < ApplicationRecord
  belongs_to :items
  has_many :requests
end
