class Inventory < ApplicationRecord

  has_many :inventory_items
  has_many :items, through: :inventory_items

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :sorted, -> { order(:name) }
  scope :names, -> { select(:name, :id) }
  scope :counted, -> { count(:id) }

  def abbreviate
    name.delete("aeiou")
  end


end
