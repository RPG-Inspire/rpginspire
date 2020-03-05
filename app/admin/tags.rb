ActiveAdmin.register Tag do
  permit_params :title, :tag_type

  form do |f|
    f.inputs do
      f.input :title
      f.input :tag_type
    end
    f.actions
  end
end

