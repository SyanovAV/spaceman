class Collection < ApplicationRecord
  belongs_to :request, optional: true
  belongs_to :folder, optional: true
end
