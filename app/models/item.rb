class Item < ApplicationRecord
  has_many :requests
  belongs_to :collection, class_name: "Item", optional: true
  validates :name, presence: true,
            length: { minimum: 5 }
end
