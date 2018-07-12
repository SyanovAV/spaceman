class Request < ApplicationRecord
  has_many :datas
  has_many :responses
  belongs_to :item, optional: true
end
