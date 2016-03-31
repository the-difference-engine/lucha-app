class RegistrationsController < Devise::RegistrationsController
	skip_before_action :authenticate_client!
	before_filter :configure_permitted_parameters



  def after_sign_up_path_for(client)
    client_path(client)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name, :home_phone, :cell_phone, :address, :state, :city, :ward, :zip_code, :authorization_and_waiver, :privacy_policy_authorization
    	)
  end
  
end
