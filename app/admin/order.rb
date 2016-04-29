ActiveAdmin.register Order do

  menu priority: 5

  permit_params :date, :user_id, :sum

  index do
    selectable_column
    id_column
    column :date
    column :user_id
    column :sum
    column :created_at
    column :updated_at
    actions
  end

  filter :date
  filter :user_id
  filter :sum

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Admin Details" do
      f.input :date
      f.input :user_id, :as => :select, :collection => User.all.map{|u| [u.email, u.id]}
      f.input :sum

      f.inputs 'Items' do
        f.has_many :order_items do |item_f|
          item_f.semantic_errors *item_f.object.errors.keys
          item_f.input :menu_id \
              , :as => :select \
              , :collection => Menu.all.map { 
                   |m| ["\##{m.id} #{m.date} #{m.product.category.title} #{m.product.name} #{m.price}", m.id]
              }
          item_f.actions
        end
      end

    end
    f.actions
  end

end
