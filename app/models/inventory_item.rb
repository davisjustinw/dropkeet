class InventoryItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :item

  has_many :entries

  scope :by_item, -> (item) { where(item_id: item) }
  scope :by_inventory, -> (inventory) { where(inventory_id: inventory)}
  scope :all_items, -> { select(:item_id).distinct.order(:item_id) }
  scope :all_loaded, -> { includes(:item) }

  def self.index_hash
    all_loaded.inject({}) do |hash, inv_item|
      item_id = inv_item.item_id
      inv_id = inv_item.inventory_id
      par = inv_item.par

      hash[item_id] = {} if !hash[item_id]
      hash[item_id][inv_id] = { par: par, obj: inv_item }
      hash
    end
  end

  def sum_entries
    entries.sum(:qty)
  end
end
