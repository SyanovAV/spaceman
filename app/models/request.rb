class Request < ApplicationRecord
  has_many :datas
  has_many :responses
  belongs_to :collection
  belongs_to :folder, optional: true
end
