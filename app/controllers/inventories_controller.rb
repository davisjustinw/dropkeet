class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.sorted
  end

  def show
    @inventories = Inventory.sorted
    @inventory = Inventory.find(params[:id])

    @items = @inventory.items
  end

  def edit
    @inventory = Inventory.find(params[:id])
    @items = Item.all
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
