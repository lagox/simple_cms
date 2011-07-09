class DemoController < ApplicationController
  
  layout 'admin'
  
  def index
    #render('hello')
    #redirect_to(:action => 'other_hello')
  end
  
  def hello
    @array = [1,2,3,4,5]
    @id = params[:id].to_i
    @page = params[:page].to_i
  end
  
  def other_hello
    render(:text => "Hello Everyone!")
  end
  
  def javascript  
  end
  
  def text_helpers
    
  end
  
  def escape_output
      
  end
  
  def make_error
    render(:text => "test")
    #render(:text => @something.upcase)
    #render(:text => "1" + 1)
  end
  
  def logging
    @subjects = Subject.all
    ActiveSupport::Deprecation.warn("This is a deprecation")
    logger.debug("This is a debug")
    logger.info("This is info")
    logger.warn("This is warn")
    logger.error("This is error")
    logger.fatal("This is fatal")
    render(:text => 'Logged!')
  end
  
end