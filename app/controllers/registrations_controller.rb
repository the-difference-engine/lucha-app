class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(client)
    client_edit_path(client)
  end

end
