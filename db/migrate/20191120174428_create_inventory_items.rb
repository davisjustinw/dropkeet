class CreateInventoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_items do |t|
      t.integer :inventory_id
      t.integer :item_id

      t.timestamps
    end
  end
end
