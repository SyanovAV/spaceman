class Collection < ApplicationRecord
  belongs_to :request
  belongs_to :folder
end
