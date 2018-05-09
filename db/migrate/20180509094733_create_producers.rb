class CreateProducers < ActiveRecord::Migration[5.1]
  def change
    create_table :producers do |t|
      t.string :area
      t.boolean :pesticide, default: false
      t.string :producer_image
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
