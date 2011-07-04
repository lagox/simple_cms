class PagesController < ApplicationController
  
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @pages = Page.order("pages.position ASC")
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.order("position ASC")
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page created"
      redirect_to(:action => 'list')
    else
      @page_count = Page.count + 1
      @subjects = Subject.order("position ASC")
      render('new')
    end
  end
  
  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.order("position ASC")
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Page updated."
      redirect_to(:action => 'show', :id => @page.id)
    else
      @page_count = Page.count
      @subjects = Subject.order("position ASC")
      render('edit')
    end
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    Page.find(params[:id]).destroy
    flash[:notice] = "Page destroyed."
    redirect_to(:action => 'list')
    
  end
end
