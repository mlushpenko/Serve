class UsersController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :load_user, :except => [:index, :new]

  def index
    # Reference on how to use SalesForce SOQL
    # client = dbdc_client
    # @contacts = client.query("SELECT Id, Name, Email FROM Contact")
    # @tasks_list = @contacts.map{|c|client.query("SELECT Id, WhoId, Description FROM Task WHERE WhoId = '#{c.Id}' ")}
    # @required_attachments_list = @tasks_list.map{|tasks_per_contact| tasks_per_contact.map{|task| client.query("SELECT Id, ParentId, Name FROM Attachment WHERE ParentId = '#{task.Id}' ")}}
    
    @contact = Contact.find_by_Email("iviakciivi@hotmail.com")
    @tasks = Task.find_all_by_WhoId(@contact.Id)
    @attachments = @tasks.map{|task| Attachment.find_all_by_ParentId(task.Id)}
    # @tasks_list = @contacts.map{|c| Task.find_all_by_WhoId(c.Id)}
    # @required_attachments_list = @tasks_list.map{|tasks_per_contact| tasks_per_contact.map{|task| Attachment.find_all_by_ParentId(task.Id)}}
    
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    User.create User.coerce_params(params[:user])
    flash[:info] = "The user was created!"
    redirect_to users_path
  end

  def edit
  end

  def update
    @user.update_attributes User.coerce_params(params[:user])
    flash[:info] = "The user was updated!"
    redirect_to user_path(@user)
  end

  def destroy
    @user.delete
    flash[:info] = "The user was deleted!"
    redirect_to users_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end
end
