class Client::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

	protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) do |client_params|
      client_params.permit(:first_name,
          :last_name,
          :email,
          :authorization_and_waiver,
          :privacy_policy_authorization,
          :race,
          :sex,
          :home_phone,
          :work_phone,
          :cell_phone,
          :address,
          :state,
          :city,
          :zip_code,
          :ward,
          :ssn,
          :preferred_contact_method,
          :preferred_language,
          :other_language,
          :dob,
          :head_of_household,
          :num_in_household,
          :num_of_dependants,
          :education_level,
          :disability,
          :disability_in_household,
          :over_sixty_two,
          :union_member,
          :military_service_member,
          :volunteer_interest,
          :estimated_household_income,
          :authorization_and_waiver,
          :privacy_policy_authorization,
          :password,
          :password_confirmation)
    end
	end
end
