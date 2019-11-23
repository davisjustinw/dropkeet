class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :item

  has_many :meta_templates
  # has_many :meta_tags, through: :meta_templates
  has_many :entries
end
