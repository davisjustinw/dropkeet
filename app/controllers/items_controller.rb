class ItemsController < ApplicationController

  def edit
    @item = Item.find(params[:id])
    @inventories = Inventory.sorted
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    redirect_to inventory_items_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to inventory_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, item_tags_attributes: [:id, :_destroy, :item_id, :tag_id], tags_attributes: [:label])
  end

end
