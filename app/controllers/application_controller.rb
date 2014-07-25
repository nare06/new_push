class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #layout 'flatly'
  # authorize_resource class: false
 # include SessionsHelper
 
  # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
  
before_filter :update_sanitized_params, if: :devise_controller?
  protect_from_forgery
 rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
   
  end 
  
   # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
 
def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation,:role,:campus)}
end

end
