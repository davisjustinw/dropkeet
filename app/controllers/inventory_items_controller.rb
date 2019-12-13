class InventoryItemsController < ApplicationController

  def index

    @inventory_items = InventoryItem.index_hash
    @inventories = Inventory.sorted.names
    @items = Item.sorted.names
  end

  def edit
    raise "weeee"
  end

end
