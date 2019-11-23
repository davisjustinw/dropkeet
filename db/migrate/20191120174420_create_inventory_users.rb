class CreateInventoryUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_users do |t|
      t.string :role
      t.integer :inventory_id
      t.integer :user_id

      t.timestamps
    end
  end
end
