ActiveAdmin.register Category do

  menu :priority => 2
  
  controller do

    def create
      create! do |format|
         format.html { redirect_to new_admin_book_url }
      end
    end
    
  end
  
end
