module ItemsHelper
  def par_link( inventory, item )

  end

  def get_inventory_item( inventory, item )
    item.inventory_items.find_by(inventory_id: inventory.id)
  end

  def par_value(inventory, item)
    #inventory_item = get_inventory_item( inventory, item )
    inventory_item = @inventory_items.find_by(inventory_id: inventory.id, item_id: item.id)
    if inventory_item
      return inventory_item.par
    else
      return 'na'
    end
  end
end
