module EntriesHelper
  def setup_entry(inventory_item, entry)
    meta = inventory_item.item.meta

    # Build entry_meta tags if not present (new)
    # else skip (rejected create)
    if entry.entry_meta.empty?
      meta.each do |metum|
        entry.entry_meta.build(metum: metum)
      end
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
