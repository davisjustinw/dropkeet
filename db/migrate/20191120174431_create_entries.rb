class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.integer :qty
      t.string :unit
      t.integer :inventory_item_id
      
      t.timestamps
    end
  end
end
