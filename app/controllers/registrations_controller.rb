class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_in_path_for(resource)
  	users_preferences_path
  end
  def after_sign_up_path_for(resource)
    users_preferences_path
  end
  def after_inactive_sign_up_path_for(resource)
    redirect_to new_user_registration_path
  end
end