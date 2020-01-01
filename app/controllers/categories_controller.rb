class CategoriesController < ApplicationController
  def index
    @categories = Category.sorted
    @inventories = Inventory.sorted
  end

  def new
    @category = Category.new
    @inventories = Inventory.sorted
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render "new"
    end
  end

  def show
    @inventories = Inventory.sorted
    @category = Category.find(params[:id])
    @items = @category.items.sorted
  end

  private
  def category_params()
    params.require(:category).permit(:name)
  end

  #new, show, list items associate.  send github to Dustin
end
