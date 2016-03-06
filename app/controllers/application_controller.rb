class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_client!, unless: :clients_controller?
  Devise::SessionsController.skip_before_filter :authenticate_client!


  def authenticate_user!
    if current_user 
      redirect_to employee_index_path
    elsif current_client
      redirect_to clients_path
    end
  end

  def authenticate_client!
    if current_client
      redirect_to client_path(current_client.id)
      flash[:notice] = "Can't go there"

    end
  end

  def authenticate_current_client!
    unless current_user || current_client.id == params[:id].to_i
      flash[:notice] = "You may only view your own profile."
      redirect_to client_path(current_client.id)
    end
  end

  def clients_controller?
    self.class == ClientsController    
  end
    

  def authenticate_employee!
    unless current_user
      redirect_to new_user_session_path 
      flash[:warning] = "Not an employee."  
    end
	end

end
