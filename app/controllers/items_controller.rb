class ItemsController < ApplicationController
  def index
    @items = Item.all
    @inventories = Inventory.all
  end
end
