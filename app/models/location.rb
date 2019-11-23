class Location < ApplicationRecord
  belongs_to :parent, class_name: 'Inventory'
  belongs_to :child, class_name: 'Inventory'
end
