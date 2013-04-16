class CategoriesController < InheritedResources::Base

  respond_to :html, :xml, :json
  
  before_filter :books, :only => :index

  def books
    if params[:ord]
      if params[:id]
        @category = Category.find(params[:id])
        @books = Book.category_books(@category).order_by_title(params[:ord])
      else
        @books = Book.order_by_title(params[:ord]).limit(16)
      end
    elsif params[:id]
      @category = Category.find(params[:id])
      @books = Book.category_books(@category)
    else
      @books = Book.recent
    end
  end
    
end
