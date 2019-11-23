class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :inventory_users, :inventories
    add_foreign_key :inventory_users, :users
    add_foreign_key :inventory_items, :inventories
    add_foreign_key :inventory_items, :items
    add_foreign_key :entries, :inventory_items
    add_foreign_key :entry_meta_tags, :entries
    add_foreign_key :entry_meta_tags, :meta_tags
    add_foreign_key :meta_templates, :meta_tags
    add_foreign_key :meta_templates, :inventory_items
    add_foreign_key :item_hash_tags, :items
    add_foreign_key :item_hash_tags, :hash_tags
  end
end
