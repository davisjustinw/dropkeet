class InventoryItemsController < ApplicationController

  def edit
    @inventory_item = InventoryItem.find(params[:id])
  end

  def update
    @inventory_item = InventoryItem.find(params[:id])
    @inventory_item.update(inventory_item_params)

    redirect_to items_path
  end

  def new
    @inventory_item = InventoryItem.new(inventory_item_params)

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
