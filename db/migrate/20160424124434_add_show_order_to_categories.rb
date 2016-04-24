class AddShowOrderToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :show_order, :integer
  end
end
