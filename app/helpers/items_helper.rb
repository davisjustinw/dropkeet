module ItemsHelper

  def setup_item(item)
    (Tag.all - item.tags).each do |tag|
      item.item_tags.build(tag: tag)
    end
    item.tags.build

    (Metum.all - item.meta).each do |metum|
      item.item_meta.build(metum: metum)
    end
    item.meta.build
    
    item
  end

  def sorted_tags(tags)
    tags.sort { |a,b| a.tag.label.downcase <=> b.tag.label.downcase }
  end

  def sorted_meta(meta)
    meta.sort { |a,b| a.metum.label.downcase <=> b.metum.label.downcase }
  end
end
