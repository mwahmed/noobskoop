class ApplicationController < ActionController::Base
  protect_from_forgery
	
	
	
	protected 
    def currentCourse
      return unless Course.find(params[:id])
      @current_course = Course.find(params[:id]) #||= Course.find_by_id(session[:user_id]) 
    end
    
    helper_method :current_course

  include SessionsHelper
  
  
  # got these tips from
  # http://lyconic.com/blog/2010/08/03/dry-up-your-ajax-code-with-the-jquery-rest-plugin
  before_filter :correct_safari_and_ie_accept_headers
  after_filter :set_xhr_flash

  def set_xhr_flash
    flash.discard if request.xhr?
  end

  def correct_safari_and_ie_accept_headers
    ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
    request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
  end
  
  
end
