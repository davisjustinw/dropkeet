class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :location_users, :locations
    add_foreign_key :location_users, :users
    add_foreign_key :inventory_items, :locations
    add_foreign_key :inventory_items, :items
    add_foreign_key :entries, :inventory_items
    add_foreign_key :entries, :entry_tags
    add_foreign_key :entry_tags, :entries
    add_foreign_key :template_tags, :tags
    add_foreign_key :template_tags, :inventory_items
    add_foreign_key :item_tags, :items
    add_foreign_key :item_tags, :tags
  end
end
