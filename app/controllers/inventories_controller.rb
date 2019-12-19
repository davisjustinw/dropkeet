class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.sorted
  end

  def show
    @inventories = Inventory.sorted
    @inventory = Inventory.find(params[:id])

    @inventory_items = @inventory.inventory_items
  end

  def edit
    @inventories = Inventory.all
    @inventory = Inventory.find(params[:id])
  end

  def update
    @inventory = Inventory.find(params[:id])
    @inventory.update(inventory_params)
    redirect_to inventory_path(@inventory)
  end

  def new
    @inventories = Inventory.sorted
    @parent = Inventory.find(params[:parent_id]) if params[:parent_id]
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.create(inventory_params)
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
