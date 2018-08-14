class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.references :transaction, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
