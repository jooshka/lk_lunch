class AddShowOrderToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :show_order, :integer, null: false
    add_index  :categories, :show_order, unique: true
  end
end
