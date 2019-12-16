class Item < ApplicationRecord
  has_many :inventory_items
  has_many :inventories, through: :inventory_items

  has_many :item_tags
  has_many :tags, through: :item_tags

  has_many :item_meta
  has_many :meta, through: :item_meta

  accepts_nested_attributes_for :item_tags, :allow_destroy => true
  accepts_nested_attributes_for :tags, reject_if: proc { |attr| attr['label'].blank? }
  accepts_nested_attributes_for :item_meta, :allow_destroy => true
  accepts_nested_attributes_for :meta, reject_if: proc { |attr| attr['label'].blank? }

  scope :sorted, -> { order(:name) }
  scope :names, -> { select(:name, :id) }

  def abbreviate
    name.delete("aeiouwhy")
  end


end
