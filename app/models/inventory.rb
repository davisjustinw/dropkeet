class Inventory < ApplicationRecord
  has_many :parented_locations, foreign_key: :child_id, class_name: 'Location'
  has_many :parents, through: :parented_locations

  has_many :childing_locations, foreign_key: :parent_id, class_name: 'Location'
  has_many :children, through: :childing_locations

  has_many :inventory_items
end
