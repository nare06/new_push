class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
skip_before_filter :authenticate_user!
    	

def all
p env["omniauth.auth"]
#@user = env["omniauth.auth"]
user = User.from_omniauth(env["omniauth.auth"], current_user)
#session[:user_id] = user.id
if user.persisted?
  flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
#render 'new'
  event = Event.new
   if session[:events]
    event = Event.create(params[:event], session[:events])
  end
   if event.new_record?
      sign_in_and_redirect(user)
     else     
       session.delete(:events) unless event.new_record?
       redirect_to new_event_path
   end
else
session["devise.user_attributes"] = user.attributes
redirect_to new_user_registration_url
end
end

def failure
      #handle you logic here..
      #and delegate to super.
      super
   end


alias_method :facebook, :all
alias_method :twitter, :all
alias_method :linkedin, :all
alias_method :github, :all
alias_method :passthru, :all
alias_method :google_oauth2, :all
end
