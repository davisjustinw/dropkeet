class CreateMeta < ActiveRecord::Migration[6.0]
  def change
    create_table :meta do |t|
      t.string :label

      t.timestamps
    end
  end
end
