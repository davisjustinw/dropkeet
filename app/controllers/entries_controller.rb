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
    if @inventory_item.save
      redirect_to inventory_item_entries_path @inventory_item
    else
      @entry = @inventory_item.entries.last
      @inventories = Inventory.all
      @breadcrumbs = [
        {label: 'Home', path: root_path},
        {label: @inventory_item.inventory.name, path: inventory_path(@inventory_item.inventory)},
        {label: @inventory_item.item.name, path: inventory_item_entries_path(@inventory_item)},
        {label: 'new', path: new_inventory_item_entry_path(@inventory_item)}
      ]
      render :new
    end
  end

  def edit
    @inventories = Inventory.all
    @inventory_item = InventoryItem.find(params[:inventory_item_id])
    @entry = Entry.find(params[:id])
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: @inventory_item.inventory.name, path: inventory_path(@inventory_item.inventory)},
      {label: @inventory_item.item.name, path: inventory_item_entries_path(@inventory_item)},
      {label: 'edit entry', path: edit_inventory_item_entry_path(@inventory_item)}
    ]
  end

  def update
    @entry = Entry.find(params[:id])
    @inventory_item = InventoryItem.find(params[:inventory_item_id])
    @entry.update(entry_params)

    if @entry.save
      redirect_to inventory_item_entries_path(@inventory_item)
    else
      @inventory = @inventory_item.inventory
      @inventories = Inventory.all
      @breadcrumbs = [
        {label: 'Home', path: root_path},
        {label: @inventory.name, path: inventory_path(@inventory)},
        {label: 'New', path: new_inventory_item_path}
      ]
      render :edit
    end

  end

  private

  def entry_params
    params.require(:entry).permit(
      :qty,
      :inventory_item_id,
      entry_meta_attributes: [:id, :value, :entry_id, :metum_id])
  end
end
