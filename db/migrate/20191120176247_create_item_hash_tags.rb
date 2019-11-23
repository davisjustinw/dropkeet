class CreateItemHashTags < ActiveRecord::Migration[6.0]
  def change
    create_table :item_hash_tags do |t|
      t.integer :item_id
      t.integer :hash_tag_id
      t.timestamps
    end
  end
end
