ActiveAdmin.register AdminUser, as: 'Admin' do     

  # My first monkey_patch)))
  module ActiveAdmin::Devise::Controller

      def root_path
        "/categories"  
      end
      
  end


  menu :priority => 1

  actions :index, :show, :edit
  
  before_filter :skip_sidebar!, :only => :index
    
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
