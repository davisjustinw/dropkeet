module ItemsHelper

  def setup_item(item)
    (Tag.all - item.tags).each do |tag|
      item.item_tags.build(tag: tag)
    end
    item
  end

  def sorted_tags(tags)
    tags.sort { |a,b| a.tag.label.downcase <=> b.tag.label.downcase }
  end

end
