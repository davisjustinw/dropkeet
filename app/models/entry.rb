class Entry < ApplicationRecord
  belongs_to :inventory_item
  has_many :entry_tags
  # has_many :meta_tags, through: :entry_meta_tags
end
