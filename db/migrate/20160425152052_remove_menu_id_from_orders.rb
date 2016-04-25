class RemoveMenuIdFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :menu, index: true, foreign_key: true
  end
end
