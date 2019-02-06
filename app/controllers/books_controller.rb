class BooksController < ApplicationController
  
  #******************************************************************************
  layout 'admin'
  before_action :book_count , :expect => [:index , :show , :delete , :destroy]
  before_action :book
  before_action :authenticate_user!
  #******************************************************************************  
  def index
    @books = Book.paginate(:page => params[:page], :per_page => 5).visible.sortedByName.where(:user_id => current_user.id)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book #{@book.name} Created successfully."
      redirect_to(books_path)
    else
      render('new')
    end
  end

  def edit
  end

  def update 
    if @book.update_attributes(book_params)
      flash[:notice] = "Book #{@book.name} Updated successfully."
      redirect_to(books_path)
    else
      render("edit")
    end
  end

  def delete
  end
  
  def destroy 
    if @book.destroy
      flash[:notice] = "Book #{@book.name} Deleted successfully."
      redirect_to(books_path)
    end
  end
  #******************************************************************************
  private 

  def book_params
    params.require(:book).permit(:name , :description , :cover_image , :position , :visible , :remove_cover_image , :remote_cover_image_url).merge(user_id: current_user.id)
  end

  def book
    @book = Book.visible.where(:id => params[:id]).first
  end

  def book_count
    @book_count = Book.count    
  end


  #******************************************************************************
end
