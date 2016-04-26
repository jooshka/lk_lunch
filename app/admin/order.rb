ActiveAdmin.register Order do

  menu priority: 5

  permit_params :date, :user_id, :sum

  index do
    selectable_column
    id_column
    column :date
    column :user_id
    column :sum
    actions
  end

  filter :date
  filter :user_id
  filter :sum

  form do |f|
    f.inputs "Admin Details" do
      f.input :date
      f.input :user_id, :as => :select, :collection => User.all.map{|u| [u.email, u.id]}
      f.input :sum
    end
    f.actions
  end

end
