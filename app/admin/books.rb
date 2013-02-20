ActiveAdmin.register Book do

   config.batch_actions = true
   
   filter:title
   
   config.per_page = 16
   
   index do
     column :image do |book|
       image_tag(book.image.url)
     end
     column :title
     column :author
     column :category_id do |book|
       Category.find(book.category_id).name
     end
     column :description
     default_actions
   end
   
    show do |book|
      attributes_table do
        row :image do
          image_tag(book.image.url)
        end
        row :title
        row :author
        row :category_id do
          Category.find(book.category_id).name
        end
        row :description
      end
      active_admin_comments
    end
   
end
