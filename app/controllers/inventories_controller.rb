class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def edit
    @inventory = Inventory.find(params[:id])
    @items = Item.all
  end

  def new
    @parent = Inventory.find(params[:parent_id]) if params[:parent_id]
    @inventory = Inventory.new
  end

  def create
    binding.pry
    @inventory = Inventory.create(inventory_params)
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
