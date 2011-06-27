class SubjectsController < ApplicationController
  
  def index
    list
    render('list')
  end
  
  def list
    @subjects = Subject.order("subjects.position ASC")
  end
  
  def show
    @subject = Subject.find(params[:id])
  end
  
  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end
  end
end
