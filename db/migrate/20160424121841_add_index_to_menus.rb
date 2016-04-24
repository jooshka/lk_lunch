class AddIndexToMenus < ActiveRecord::Migration
  def change
    add_index :menus, [:date, :product_id], unique: true
  end
end
