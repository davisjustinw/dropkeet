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
    @categories = Category.all
    @item = Item.find(params[:id])
    @inventories = Inventory.sorted.names
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: 'Items', path: items_path},
      {label: @item.name, path: edit_item_path(@item)}
    ]
  end

  def new
    @categories = Category.sorted
    @item = Item.new
    @inventories = Inventory.sorted.names
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: 'New Item', path: new_item_path}
    ]
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      @inventories = Inventory.sorted.names
      @breadcrumbs = [
        {label: 'Home', path: root_path},
        {label: 'New Item', path: new_item_path}
      ]
      render :new
    end
  end

  def update

    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id,
      item_tags_attributes: [:id, :_destroy, :item_id, :tag_id],
      tags_attributes: [:label],
      item_meta_attributes: [:id, :_destroy, :item_id, :metum_id],
      meta_attributes: [:label])
  end
end
