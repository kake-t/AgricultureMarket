class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_icon, :string
  end
end
