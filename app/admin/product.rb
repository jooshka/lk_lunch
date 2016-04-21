ActiveAdmin.register Product do
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
      f.input :category_id
      f.input :name
    end
    f.actions
  end

end
