class Inventory < ApplicationRecord

  has_many :inventory_items
  has_many :items, through: :inventory_items

  scope :sorted, -> { order(:name) }
  scope :names, -> { select(:name, :id) }
  scope :all_ids, -> { pluck :id }

  def abbreviate
    name.delete("aeiou")
  end


end
