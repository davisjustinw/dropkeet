class Item < ApplicationRecord
  has_many :inventory_items
  has_many :inventories, through: :inventory_items

  has_many :item_hash_tags
  has_many :hash_tags, through: :item_hash_tags

  has_many :meta_templates
  has_many :meta_tags, through: :meta_templates

  scope :sorted, -> { order(:name) }
  scope :names, -> { select(:name, :id) }

  def abbreviate
    name.delete("aeiouwhy")
  end


end
