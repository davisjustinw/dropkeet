class ItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.index_hash
    @inventories = Inventory.sorted.names
    @items = Item.sorted.names
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: 'Items', path: items_path}
    ]
  end

  def edit
    @item = Item.find(params[:id])
    @inventories = Inventory.sorted.names
  end

  def new
    @item = Item.new
    @inventories = Inventory.sorted.names
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: 'New Item', path: new_item_path}
    ]
  end

  def create
    @item = Item.create(item_params)
    redirect_to items_path
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name,
      item_tags_attributes: [:id, :_destroy, :item_id, :tag_id],
      tags_attributes: [:label],
      item_meta_attributes: [:id, :_destroy, :item_id, :metum_id],
      meta_attributes: [:label])
  end
end
