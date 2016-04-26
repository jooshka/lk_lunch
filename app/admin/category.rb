ActiveAdmin.register Category do

  menu priority: 2

  permit_params :title, :show_order

  index do
    selectable_column
    id_column
    column :title
    column :show_order
    actions
  end

  filter :title

  form do |f|
    f.inputs "Admin Details" do
      f.input :title
      f.input :show_order
    end
    f.actions
  end

end

