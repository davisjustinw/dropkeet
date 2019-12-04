class AddParToInventoryItems < ActiveRecord::Migration[6.0]
  def change
    add_column :inventory_items, :par, :integer
  end
end
