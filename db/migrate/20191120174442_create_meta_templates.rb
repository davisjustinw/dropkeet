class CreateMetaTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :meta_templates do |t|
      t.integer :meta_tag_id
      t.integer :inventory_item_id

      t.timestamps
    end
  end
end
