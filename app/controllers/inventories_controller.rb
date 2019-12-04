class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def edit
    @inventory = Inventory.find(params[:id])
    @items = Item.all
  end
end
