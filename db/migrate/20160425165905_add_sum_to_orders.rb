class AddSumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sum, :decimal, precision: 15, scale: 2, null: false
  end
end
