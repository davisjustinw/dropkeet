class InventoryItemsController < ApplicationController
  def edit
    @inventory_item = InventoryItem.find(params[:id])
    @inventory = @inventory_item.inventory
    @inventories = Inventory.all
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: @inventory.name, path: inventory_path(@inventory)},
      {label: @inventory_item.item.name, path: edit_inventory_item_path(@inventory_item)}
    ]
  end

  def update
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item.update(inventory_item_params)

    redirect_to items_path
  end

  def new
    @inventory_item = InventoryItem.new(inventory_item_params)
    @inventory = @inventory_item.inventory
    @inventories = Inventory.all
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: @inventory.name, path: inventory_path(@inventory)},
      {label: 'New', path: new_inventory_item_path}
    ]
  end

  def create
    @inventory_item = InventoryItem.create(inventory_item_params)
    redirect_to items_path
  end

  private
  def inventory_item_params
    params.require(:inventory_item).permit(:par, :inventory_id, :item_id)
  end
end
