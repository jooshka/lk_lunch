ActiveAdmin.register Product do

  menu priority: 3

  permit_params :name, :category_id

  index do
    selectable_column
    id_column
    column :category_id
    column :name
    actions
  end

  filter :name
  filter :category_id

  form do |f|
    f.inputs "Admin Details" do
      f.input :category_id, :as => :select, :collection => Category.all
      f.input :name
    end
    f.actions
  end

end
