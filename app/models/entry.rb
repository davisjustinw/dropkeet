class Entry < ApplicationRecord
  belongs_to :inventory_item

  has_many :entry_meta
  has_many :meta, through: :entry_meta

  accepts_nested_attributes_for :entry_meta
end
