class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_client!
    if current_user == false || current_client == false
      redirect_to new_client_session_path 
	    flash[:warning] = "Please sign in."
    end
  end

  def authenticate_employee!
	    redirect_to new_user_session_path unless current_user
      flash[:warning] = "Not an employee."  
	end

end
