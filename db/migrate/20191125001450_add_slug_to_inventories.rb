class AddSlugToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :slug, :string
    add_index :inventories, :slug, unique: true
  end
end
