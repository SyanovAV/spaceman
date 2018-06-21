class Folder < ApplicationRecord
  belongs_to :collection
  has_many :requests
end
