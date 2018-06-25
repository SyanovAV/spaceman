class Item < ApplicationRecord
  has_many :requests
  has_many :folders, class_name: 'Item',
           foreign_key: :collection_id
  belongs_to :collection, class_name: 'Item', optional: true
  validates :name, presence: true,
            length: { minimum: 5 }
end
