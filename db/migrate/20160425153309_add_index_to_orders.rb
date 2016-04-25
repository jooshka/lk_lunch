class AddIndexToOrders < ActiveRecord::Migration
  def change
    add_index :orders, [:date, :user_id], unique: true
  end
end
