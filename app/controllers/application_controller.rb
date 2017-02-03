class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # before_action :authenticate_client!, unless: :clients_controller?
  before_filter :set_locale

  def authenticate!
    unless current_client || current_user
      redirect_to "/"
    end
  end

  def verify_user!
    unless current_user
      redirect_to "/"
    end
  end

  def authenticate_client!
    unless current_client
      flash[:notice] = "Unathenticated Client!"
      redirect_to "/"
    end
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end



  def clients_controller?
    self.class == ClientsController
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
