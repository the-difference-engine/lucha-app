class RegistrationsController < Devise::RegistrationsController
	skip_before_action :authenticate_client!
	before_filter :configure_permitted_parameters



  def after_sign_up_path_for(client)
    client_edit_path(client)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :home_phone, :cell_phone, :address, :state, :ward, :zip_code
    	)
  end
  
end
