class Book < ActiveRecord::Base

   attr_accessible :image, :title, :author, :description, :category_id
   
   belongs_to :categorie
   
   validates_presence_of :image, :title, :author, :description, :category_id
   
   has_attached_file :image,
               :url  => "/assets/books/:id/:basename.:extension",
               :path => ":rails_root/public/assets/books/:id/:basename.:extension"
   validates_attachment_presence :image
   validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
   
   scope :recent, order('id desc').limit(16)
   
   scope :category_books, lambda { |category| where(:category_id => category.id) }
   
   scope :order_by_title, lambda {|order|(order.to_s == "asc")? order("title asc") : order("title desc") }
   
end
