class Metum < ApplicationRecord
  has_many :item_meta
  has_many :items, through: :meta
end
