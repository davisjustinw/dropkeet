class ItemsController < ApplicationController

  def edit
    @item = Item.find(params[:id])
    @inventories = Inventory.sorted
  end

  def update
    raise "fuckit"
  end
end
