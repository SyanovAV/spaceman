class Request < ApplicationRecord
  belongs_to :data
  belongs_to :response
end
