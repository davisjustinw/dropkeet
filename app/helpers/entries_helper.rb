module EntriesHelper
  def setup_entry(inventory_item, entry)
    meta = inventory_item.item.meta
    meta.each do |metum|
      entry.entry_meta.build(metum: metum)
    end
    [inventory_item, entry]
  end

  def metum_value(metum_hash, entry, metum)
    if(metum_hash[entry.id] && metum_hash[entry.id][metum.id])
      "#{metum_hash[entry.id][metum.id][:value]}"
    else
      "na"
    end
  end
end
