class SectionsController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in
  before_filter :find_pages
  def index
    list
    render('list')
  end
  
  def list
    @sections = Section.order("sections.position ASC").where(:page_id => @page.id)
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    @section = Section.new(:page_id => @page.id)
    @section_count = Section.count + 1
    @pages = Page.order('position ASC')
  end
  
  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "Section created."
      redirect_to(:action => "list", :page_id => @section.page_id)
    else
      @section_count = Section.count + 1
      @pages = Page.order('position ASC')
      render("new")
    end
  end
  
  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.order('position ASC')
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      flash[:notice] = "Section updated."
      redirect_to(:action => "show", :id => @section.id, :page_id => @section.page_id)
    else
      @section_count = Section.count
      @pages = Page.order('position ASC')
      render("edit")
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    Section.find(params[:id]).destroy
    flash[:notice] = "Page destroyed."
    redirect_to(:action => 'list', :page_id => @page.id)
  end
  
  private
  
  def find_pages
    if params[:page_id]
      @page = Page.find_by_id(params[:page_id])
    end
  end
end
