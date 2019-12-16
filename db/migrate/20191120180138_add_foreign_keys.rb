class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :inventory_items, :inventories
    add_foreign_key :inventory_items, :items
    add_foreign_key :entries, :inventory_items
    add_foreign_key :item_tags, :items
    add_foreign_key :item_tags, :tags
  end
end
