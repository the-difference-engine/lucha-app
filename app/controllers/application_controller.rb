class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate_client!, unless: :clients_controller?


  def authenticate_user!
    if current_user 
      redirect_to employee_index_path
    elsif current_client
      redirect_to client_edit_path
    else
      redirect_to "/"
    end
  end

  def authenticate_current_client!
    # unless current_user || current_client.id == params[:id].to_i
    #   flash[:notice] = "You may only view your own profile."
    #   redirect_to client_path(current_client.id)
    # end
  end

  def clients_controller?
    # self.class == ClientsController    
  end
    

  def authenticate_employee!
    # unless current_user
    #   redirect_to new_user_session_path 
    #   flash[:warning] = "Not an employee."  
    # end
	end

  # def after_sign_in_path_for(client)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || client_status_path(client)
  # end

  # def after_sign_in_path_for(user)
  #   request.env['omniauth.origin'] || stored_location_for(resource) || employee_index_path
  # end

  # def authenticate_client_application
  #   if current_client.foreclosure.
  # end


end
