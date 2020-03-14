ActiveAdmin.register Topic do
  permit_params :title, :slug, :link, :image, :body, :tag_ids, :user_id

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :slug
      f.input :image
      f.input :user
    end
    f.inputs "Content" do
      f.input :link
      f.input :body
    end
    f.inputs "Tags" do
      f.input :tags, :as => :check_boxes
    end

    f.submit
  end
end
