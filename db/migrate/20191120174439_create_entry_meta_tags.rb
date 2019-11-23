class CreateEntryMetaTags < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_meta_tags do |t|
      t.integer :entry_id
      t.integer :meta_tag_id

      t.timestamps
    end
  end
end
