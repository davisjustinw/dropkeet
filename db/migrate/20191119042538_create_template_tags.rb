class CreateTemplateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :template_tags do |t|
      t.integer :tag_id
      t.integer :inventory_item_id

      t.timestamps
    end
  end
end
