class Book < ActiveRecord::Base
   belongs_to :categorie
   validates_presence_of :image, :title, :author, :description
end
