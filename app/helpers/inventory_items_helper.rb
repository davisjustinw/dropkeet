module InventoryItemsHelper
  def par_value( par_hash, inventory, item )
    if par_hash[item.id] && par_hash[item.id][inventory.id]
      link_to edit_inventory_item_path( par_hash[item.id][inventory.id][:obj] ) do
        "#{par_hash[item.id][inventory.id][:par]}"
      end
    else
      link_params = { inventory_item: { inventory_id: inventory.id, item_id: item.id } }
      link_to new_inventory_item_path( params: link_params ) do
        "+"
      end
    end
  end

end
