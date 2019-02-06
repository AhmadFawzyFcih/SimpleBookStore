class SectionsController < ApplicationController
 #*******************************************
 layout 'admin'
 before_action :section
 before_action :data_common , :expect=>[:index , :show , :delete , :destroy]  
 before_action :authenticate_user!
 #*******************************************
 def index
   @sections = Section.visible.sortedByName
 end

 def show
 end

 def new
   @section = Section.new
 end

 def create
   @section = Section.new(section_params)
   if @section.save
     flash[:notice] = "  #{@section.name} Created  Successfully...!"
     redirect_to(sections_path)
   else
     render('new')
   end
 end

 def edit
 end

 def update 
   if @section.update_attributes(section_params)
     flash[:notice] = "  #{@section.name} Updated  Successfully...!"
     redirect_to(sections_path)
   else
     render('edit')
   end
 end

 def delete
 end

 def destroy 
   if @section.destroy
     flash[:notice] = "  #{@section.name} Deleted  Successfully...!"
     redirect_to(sections_path)
   end
 end
 #*******************************************
 private
 def section_params
   params.require(:section).permit(:page_id , :name , :position , :visible , :content_type , :content )
 end

 def section 
   @section = Section.visible.where(:id => params[:id]).first
 end

 def data_common
   @section_count = Section.count
   @pages         = Page.visible.sortedByTitle
 end
 #*******************************************
end
