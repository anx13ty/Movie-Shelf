class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  helper_method :admin?
  
  
  protected
  
  def authorize
    unless admin?
      flash[:notice] = "Unauthorized Access"
      redirect_to movies_path
      false
    end
  end
  
  
  def admin?
    session[:password] == '4cubs'
  end
end
