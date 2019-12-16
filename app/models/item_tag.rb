class ItemTag < ApplicationRecord
  belongs_to :item
  belongs_to :tag

  scope :sorted, -> { joins(:tag).merge(order('label')) }
end
