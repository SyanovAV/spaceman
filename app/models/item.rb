class Item < ApplicationRecord
  has_many :requests
  has_many :childrens, class_name: 'Item',
           foreign_key: :parent_id
  belongs_to :parent, class_name: 'Item', optional: true
  validates :name, presence: true,
            length: { minimum: 5 }
end
