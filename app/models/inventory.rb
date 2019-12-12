class Inventory < ApplicationRecord
  #slug :name
  has_many :parented_locations, foreign_key: :child_id, class_name: 'Location'
  has_many :parents, through: :parented_locations

  has_many :childing_locations, foreign_key: :parent_id, class_name: 'Location'
  has_many :children, through: :childing_locations

  has_many :inventory_items
  has_many :items, through: :inventory_items

  scope :sorted, -> { order(:name) }
  scope :names, -> { select(:name, :id) }
  scope :all_ids, -> { pluck :id }
  # come back to this to refine to scope
  def self.no_parents
    self.select { |i| i.parents.empty? }
  end
  #scope :no_parents, -> {
  #  binding.pry
  #}

  def abbreviate
    name.delete("aeiou")
  end


end
