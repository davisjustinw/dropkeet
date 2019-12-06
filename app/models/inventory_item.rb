class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :item
  
  has_many :entries
end
