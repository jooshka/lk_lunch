ActiveAdmin.register Menu do
  permit_params :date, :product_id, :price

  index do
    selectable_column
    id_column
    column :date
    column :product_id
    column :price
    actions
  end

  filter :date
  filter :product_id
  filter :price

  form do |f|
    f.inputs "Admin Details" do
      f.input :date
      f.input :product_id
      f.input :price
    end
    f.actions
  end

end
