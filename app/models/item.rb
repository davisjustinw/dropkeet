class Item < ApplicationRecord
  has_many :inventory_items
  has_many :item_hash_tags
end
