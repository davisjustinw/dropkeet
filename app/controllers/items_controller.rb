class ItemsController < ApplicationController

  def edit
    @item = Item.find(params[:id])
    @inventories = Inventory.sorted
  end

  def new
    @item = Item.new
    @meta_tags = MetaTag.all
  end

  def create
    @item = Item.create(item_params)

    raise "fuckit"
  end

  def update
    raise "fuckit"
  end

  private

  def item_params
    params.require(:item).permit(:name, :meta_tag_id)
  end

  def meta_tag_params
    params.require(:meta_tags).permit(:ids)
  end
end
