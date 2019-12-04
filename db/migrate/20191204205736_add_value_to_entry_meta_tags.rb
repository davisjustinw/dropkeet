class AddValueToEntryMetaTags < ActiveRecord::Migration[6.0]
  def change
    add_column :entry_meta_tags, :value, :string
  end
end
