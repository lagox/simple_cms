class PagesController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in
  before_filter :find_subject
  def index
    list
    render('list')
  end
  
  def list
    @pages = Page.order("pages.position ASC").where(:subject_id => @subject.id)
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new(:subject_id => @subject.id)
    @page_count = Page.count + 1
    @subjects = Subject.order("position ASC")
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Page created"
      redirect_to(:action => 'list', :subject_id => @page.subject_id)
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
      redirect_to(:action => 'show', :id => @page.id, :subject_id => @page.subject_id)
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
    redirect_to(:action => 'list', :subject_id => @subject.id)
  end
  
  private
  
  def find_subject
    if params[:subject_id]
      @subject = Subject.find_by_id(params[:subject_id])
    end
  end
end
