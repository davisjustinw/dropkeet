class EntriesController < ApplicationController
  def index
    if params[:inventory_item_id]
      @inventory_item = InventoryItem.find(params[:inventory_item_id])
      @entries = @inventory_item.entries
      @meta =  @inventory_item.item.meta
      @entry_meta = EntryMetum.index_hash
      @breadcrumbs = [
        {label: 'Home', path: root_path},
        {label: @inventory_item.inventory.name, path: inventory_path(@inventory_item.inventory)},
        {label: @inventory_item.item.name, path: inventory_item_entries_path(@inventory_item)}
      ]
    else
      @entries = Entry.all
    end
    @inventories = Inventory.all
  end

  def new
    @inventories = Inventory.all
    @inventory_item = InventoryItem.find(params[:inventory_item_id])
    @entry = @inventory_item.entries.build
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: @inventory_item.inventory.name, path: inventory_path(@inventory_item.inventory)},
      {label: @inventory_item.item.name, path: inventory_item_entries_path(@inventory_item)},
      {label: 'new', path: new_inventory_item_entry_path(@inventory_item)}
    ]
  end

  def create
    @inventory_item = InventoryItem.find(params[:inventory_item_id])
    @inventory_item.entries.create(entry_params)
    redirect_to inventory_item_entries_path @inventory_item
  end

  private

  def entry_params
    params.require(:entry).permit(
      :qty,
      :inventory_item_id,
      entry_meta_attributes: [:id, :value, :entry_id, :metum_id])
  end
end
