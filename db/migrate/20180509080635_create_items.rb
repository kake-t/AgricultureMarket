class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :item_image, null: false
      t.boolean :state, null: false, default: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
