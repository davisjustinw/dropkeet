class Metum < ApplicationRecord
  has_many :item_meta
  has_many :items, through: :item_meta

  has_many :entry_meta
  has_many :entries, through: :entry_meta
end
