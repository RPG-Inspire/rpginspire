ActiveAdmin.register Topic do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :slug, :link, :image, :body, :tag_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :slug, :link, :image, :body, :tag_id, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
