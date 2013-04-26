class UsersController < ApplicationController
  include Databasedotcom::Rails::Controller
  before_filter :load_user, :except => [:index, :new]

  def index
    #Get emails with attachments for contact
    @contact = Contact.find_by_Email("iviakciivi@hotmail.com")
    tasks = Task.find_all_by_WhoId(@contact.Id)
    @emails = tasks.map{|task| Mail.new(task.Description)}
    @attachments = tasks.map{|task| Attachment.find_all_by_ParentId(task.Id)}

    # #Get emails for company
    # @account = Account.find_by_name("Maksym Lushpenko contacts")
    # account_tasks = Task.find_all_by_AccountId(@account.Id)
    # @account_emails = account_tasks.map{|task| Mail.new(task.Description.gsub(/Additional /,''))}

    # Reference on how to use SalesForce SOQL
    client = dbdc_client
    @account = client.query("SELECT Id, Name FROM Account WHERE Name = 'Maksym Lushpenko contacts' ").first
    account_tasks = client.query("SELECT AccountId, Description FROM Task WHERE AccountId = '#{@account.Id}' LIMIT 6 ") #OFFSET 7
    @account_emails = account_tasks.map{|task| Mail.new(task.Description.gsub(/Additional /,''))}
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
