class RenameSalerColumnToItems < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :saler_id, :seller_id
  end
end
