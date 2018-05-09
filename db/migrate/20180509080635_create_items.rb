class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :item_image, null: false
      t.boolean :state, default: false
      t.integer :price, null: false
      t.integer :saler_id
      t.integer :buyer_id
      t.text :item_content
      t.references :producer, index: true

      t.timestamps
    end
  end
end
