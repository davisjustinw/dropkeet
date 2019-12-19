class EntriesController < ApplicationController
  def index
    if params[:inventory_item_id]
      @inventory_item = InventoryItem.find(params[:inventory_item_id])
      @entries = @inventory_item.entries
      @meta =  @inventory_item.item.meta
      @entry_meta = EntryMetum.index_hash
    else
      @entries = Entry.all
    end
    @inventories = Inventory.all
  end

  def new
    @inventory_item = InventoryItem.find(params[:inventory_item_id])
    @entry = @inventory_item.entries.build
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
