class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :date, null: false
      t.references :product, index: true, foreign_key: true
      t.decimal :price, precision: 15, scale: 2, null: false

      t.timestamps null: false
    end
  end
end
