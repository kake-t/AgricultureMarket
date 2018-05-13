class ChangeNotNulToItem < ActiveRecord::Migration[5.1]
  def up
    change_column_null :items, :item_image, true
  end
end
