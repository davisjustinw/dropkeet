class Item < ApplicationRecord
  has_many :inventory_items
  has_many :inventories, through: :inventory_items

  has_many :item_tags
  has_many :tags, through: :item_tags

  accepts_nested_attributes_for :item_tags, :allow_destroy => true

  scope :sorted, -> { order(:name) }
  scope :names, -> { select(:name, :id) }

  def abbreviate
    name.delete("aeiouwhy")
  end


end
