ActiveAdmin.register Book do
     
   filter:title
   
   config.per_page = 16
   
   index do
     selectable_column
     column :id, :sortable => :id do |book|
       link_to book.id, admin_book_url(book)
     end
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
   
   show do |book| #code is similar to the index action, but I don't know how to do it "DRY".
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
   end
   
   form :html => { :multipart=>true } do |f|
     f.inputs "Book" do
       f.input :title
       f.input :author
       f.input :category_id, :label => "Category", :as => :select, :collection => Category.order("name asc").all, :selected => (params[:id]? (book.category_id or Category.all.last.id): 0)
       f.input :description
       f.input :image, :as => :file, :label => "Image",:hint => f.template.image_tag(f.object.image.url)
     end
     f.buttons
   end 

   
end
