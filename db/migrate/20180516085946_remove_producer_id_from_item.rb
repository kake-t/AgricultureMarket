class RemoveProducerIdFromItem < ActiveRecord::Migration[5.1]
  def change
    remove_index :items, :producer_id
    remove_reference :items, :producer
  end
end
