class PagesController < ApplicationController

  #*******************************************
  layout 'admin'
  before_action :page
  before_action :data_common 
  before_action :authenticate_user!
  #*******************************************
  def index
    @pages = Page.visible.sortedByTitle.where(:book_id => @book_id)
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "  #{@page.title} Created  Successfully...!"
      redirect_to(pages_path(:book_id => @book_id))
    else
      render('new')
    end
  end

  def edit
  end

  def update 
    if @page.update_attributes(page_params)
      flash[:notice] = "  #{@page.title} Updated  Successfully...!"
      redirect_to(pages_path)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy 
    if @page.destroy
      flash[:notice] = "  #{@page.title} Deleted  Successfully...!"
      redirect_to(pages_path)
    end
  end
  #*******************************************
  private

  def page_params
    params.require(:page).permit(:book_id , :title , :position , :visible)
  end

  def page 
    @page = Page.visible.where(:id => params[:id]).first
  end

  def data_common
    @page_count = Page.count
    @book_id    = params[:book_id]
    @books      = Book.visible.sortedByName.where(:id => @book_id)
  end
  #*******************************************
end
