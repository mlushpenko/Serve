class BooksController < InheritedResources::Base

  respond_to :html, :xml, :json
    
  def show
    @book = Book.find(params[:id])
    @category = Category.find(@book.category_id).name #@book.category doesn't work
  end
    
end
