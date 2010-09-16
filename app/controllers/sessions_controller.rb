class SessionsController < ApplicationController
  
  def create
    session[:password] = params[:password]
    
    if (admin?)
      flash[:notice] = 'Succesfully logged in'
      redirect_to movies_path
    else
      flash[:notice] = 'Invalid password'
      redirect_to login_path
    end
      
  end
  
  def destroy
    reset_session
    flash[:notice] = "Succesfully logged out"
    redirect_to movies_path
  end
  
end
