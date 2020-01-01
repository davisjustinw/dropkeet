class CategoriesController < ApplicationController
  def index
    @categories = Category.sorted
    @inventories = Inventory.sorted
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: 'Categories', path: categories_path}
    ]
  end

  def new
    @category = Category.new
    @inventories = Inventory.sorted
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: 'New Category', path: new_category_path}
    ]
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
    @breadcrumbs = [
      {label: 'Home', path: root_path},
      {label: @category.name, path: category_path(@category)}
    ]
  end

  private
  def category_params()
    params.require(:category).permit(:name)
  end

  #new, show, list items associate.  send github to Dustin
end
