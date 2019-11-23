class HashTag < ApplicationRecord
  has_many :item_hash_tags
  has_many :items, through: :item_hash_tags
end
