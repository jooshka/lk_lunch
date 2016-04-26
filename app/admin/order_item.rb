ActiveAdmin.register OrderItem do

  menu priority: 6

  permit_params :order_id, :menu_id

  index do
    selectable_column
    id_column
    column :order_id
    column :menu_id
    actions
  end

  filter :order_id
  filter :menu_id

  form do |f|
    f.inputs "Admin Details" do
      f.input :order_id, :as => :select, :collection => Order.all
      f.input :menu_id, :as => :select, :collection => Menu.all.map{|m| ["#{m.product.name} #{m.price}", m.id]}
    end
    f.actions
  end

end
