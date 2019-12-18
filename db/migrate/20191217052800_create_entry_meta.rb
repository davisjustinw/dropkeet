class CreateEntryMeta < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_meta do |t|
      t.integer :metum_id
      t.integer :entry_id
      t.string :value
      t.timestamps
    end
  end
end
