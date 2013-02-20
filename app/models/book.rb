class Book < ActiveRecord::Base
   attr_accessible :image, :title, :author, :description, :category_id
   belongs_to :categorie
   validates_presence_of :image, :title, :author, :description, :category_id
   
   has_attached_file :image,
               :url  => "/assets/books/:id/:basename.:extension",
               :path => ":rails_root/public/assets/books/:id/:basename.:extension"
   validates_attachment_presence :image
   validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
