ActiveAdmin.register Category do

  menu :priority => 2
  
  config.comments = false
  
  controller do

    def create 
      create! do |format|
         format.html { redirect_to :action=>"new", :controller=>"admin/books", :id => "#{Category.all.count}" }
      end
    end
    
  end
  
end
