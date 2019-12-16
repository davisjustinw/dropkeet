class CreateItemMeta < ActiveRecord::Migration[6.0]
  def change
    create_table :item_meta do |t|
      t.integer :item_id
      t.integer :metum_id

      t.timestamps
    end
  end
end
