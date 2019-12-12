class InventoryItemsController < ApplicationController

  def index

    @inventory_items = InventoryItem.includes(:inventory, :item)
    @inventories = Inventory.sorted.names
    @items = Item.sorted.names

  end


end
