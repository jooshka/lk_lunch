ActiveAdmin.register Order do
  permit_params :user_id, :menu_id

  index do
    selectable_column
    id_column
    column :user_id
    column :menu_id
    actions
  end

  filter :user_id
  filter :menu_id

  form do |f|
    f.inputs "Admin Details" do
      f.input :user_id
      f.input :menu_id
    end
    f.actions
  end

end
