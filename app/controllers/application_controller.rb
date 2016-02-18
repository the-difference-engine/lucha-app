class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authenticate_user!
    if current_user == false || current_client == false
	    redirect_to "/users/sign_in" 
	    # unless current_user && current_user.admin
	    flash[:warning] = "Please sign in."
    end
  end

  def authenticate_employee!
  	if current_user == false
  		redirect_to "/"
	    flash[:warning] = "Not an employee."
	  end
	end

end
