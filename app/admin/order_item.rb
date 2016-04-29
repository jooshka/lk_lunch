ActiveAdmin.register OrderItem do

  menu priority: 6

  permit_params :order_id, :menu_id

  index do
    selectable_column
    id_column
    column :order_id
    column :menu_id
    column :created_at
    column :updated_at
    actions
  end

  filter :order_id
  filter :menu_id

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Admin Details" do
      f.input :order_id \
              , :as => :select \
              , :collection => Order.all.map { |o| ["\##{o.id} #{o.date} #{o.user.email}", o.id]}

      f.input :menu_id \
              , :as => :select \
              , :collection => Menu.all.map  { 
                  |m| ["#{m.date} #{m.product.category.title} #{m.product.name} #{m.price}", m.id]
              }
    end
    f.actions
  end

end
