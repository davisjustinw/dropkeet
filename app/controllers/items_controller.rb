class ItemsController < ApplicationController
  def index
    @items = Item.sorted.names.includes(:inventory_items, :inventories)
    @inventories = Inventory.sorted.names
    @inventory_items = InventoryItem.all

    #raise "fuck it"
  end

  def update
    raise "fuck it"
  end
end
