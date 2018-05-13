class ChangeNotNulToItemColumns < ActiveRecord::Migration[5.1]
  def up
    change_column_null :items, :item_name, true
    change_column_null :items, :price, true
  end
end
