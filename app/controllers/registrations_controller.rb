class RegistrationsController < Devise::RegistrationsController
	skip_before_action :authenticate_client!
	
  def after_sign_up_path_for(client)
    client_edit_path(client)
  end

end
