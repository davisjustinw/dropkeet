class Entry < ApplicationRecord
  belongs_to :inventory_item

  has_many :entry_meta
  has_many :meta, through: :entry_meta

  validates :qty, presence: true, numericality: {only_integer: true}

  accepts_nested_attributes_for :entry_meta
end
