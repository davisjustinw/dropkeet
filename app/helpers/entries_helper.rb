module EntriesHelper
  def setup_entry(inventory_item, entry)
    meta = inventory_item.item.meta
    meta.each do |metum|
      entry.entry_meta.build(metum: metum)
    end
    [inventory_item, entry]
  end

end
