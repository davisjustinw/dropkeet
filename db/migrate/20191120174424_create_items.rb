class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.jsonb :unit_hash

      t.timestamps
    end
  end
end
