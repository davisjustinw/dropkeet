class Location < ApplicationRecord
  belongs_to :parent, class_name: 'Inventory'
  belongs_to :child, class_name: 'Inventory'

  validates_uniqueness_of :parent_id, :scope => :child_id
end
