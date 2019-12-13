module InventoryItemsHelper
  def par_value(par_hash, inventory, item)
    #raise "fuckit"
    if par_hash[item.id] && par_hash[item.id][inventory.id]
      #par_hash[item.id][inventory.id][:par]
      link_to edit_inventory_item_path(par_hash[item.id][inventory.id][:obj]) do
        "#{par_hash[item.id][inventory.id][:par]}"
      end
    else
      "na"
    end
  end

  def link_test
    raise "fuckit"
  end
end
