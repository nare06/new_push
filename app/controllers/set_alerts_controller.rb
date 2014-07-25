class SetAlertsController < ApplicationController

before_filter :authenticate_user!
def set_fb_alert
  @event = Event.find_by_id(params[:id])
  @user = current_user
  @fauth = @user.authorizations.where(provider: 'facebook').last
   if @fauth.blank?
      redirect_to '/users/auth/facebook'
=begin 
    token = exchange_access_token_info(@fauth.token)
    @fauth.token = token
    @fauth.save!
=end
    else [ 

     if Time.now < @fauth.updated_at + 59.days
        graph = Koala::Facebook::GraphAPI.new(@fauth.token)
         event_info = { :name => @event.title, :description => @event.organizer, :start_time => @event.sdatetime.to_datetime,
              :end_time => @event.edatetime.to_datetime, :privacy => 'FRIENDS'}
        @dump=graph.put_object('me', 'events', event_info) 
        @push = SetAlert.where(:user_id => @user.id, :event_id => @event.id).first_or_initialize
        @push.user_id =@user.id
        @push.event_id = @event.id
        @push.fbpush_id = @dump["id"]
   #  @push.gcpush_htmllink = @result.data.htmlLink
        @push.save! 
        redirect_to root_path, notice: "Event: #{@event.title}<-------> Successfully Pushed into Facebook" 
      else
        redirect_to '/users/auth/facebook', notice: "Reauthorize"
      end  ]
end
end
def remove_fb_alert
@event = Event.find_by_id(params[:id])
@user = current_user 
@fauth = @user.authorizations.where(provider: 'facebook').last 
@push = SetAlert.where(:user_id => @user.id, :event_id => @event.id).first_or_initialize
  if Time.now < @fauth.updated_at + 59.days
      graph = Koala::Facebook::GraphAPI.new(@fauth.token)   
        @dump=graph.delete_object(@push.fbpush_id) 
    if @dump
      @push.destroy
       redirect_to root_path, notice: "Event: #{@event.title}<-------> Successfully deleted the event | Facebook"
        else
        redirect_to root_path, notice: 'Failed to delete. Try again'
      end  
    else
    redirect_to '/users/auth/facebook'
  end
end
def set_google_calendar_alert  
    @evnt = Event.find_by_id(params[:id])
    event = {'summary' => @evnt.title,'location' => @evnt.location,
      'start' => {'dateTime' => @evnt.sdatetime.to_datetime.rfc3339},
      'end' => {'dateTime' => @evnt.edatetime.to_datetime.rfc3339}}
    @user = current_user
    @gauth = @user.authorizations.where(provider: 'google_oauth2').first
 
    if @gauth.present? 
         
       client = Google::APIClient.new
       client.authorization.client_id = ENV['GOOGLE_KEY']
      client.authorization.client_secret = ENV['GOOGLE_SECRET']      
      if Time.now < @gauth.updated_at + 3600
        client.authorization.access_token = @gauth.token
      else
      
      client.authorization.access_token = @gauth.token
      client.authorization.refresh_token = @gauth.secret
       client.authorization.fetch_access_token!
        @gauth.token = client.authorization.access_token
        @gauth.save!
      end
      service = client.discovered_api('calendar', 'v3')                        
      @result = client.execute(
    :api_method => service.events.insert,
    :parameters => {'calendarId' => 'primary'},
    :body => event.to_json, 
    :headers => {'Content-Type' => 'application/json'}) 
   # Rails.logger.info @result
    @push = SetAlert.where(:user_id => @user.id, :event_id => @evnt.id).first_or_initialize
    @push.gcpush_id = @result.data.id
     @push.gcpush_htmllink = @result.data.htmlLink
    @push.save!   
    redirect_to root_path, notice: "Event:#{@evnt.title}<-------> Successfully pushed into Google Calendar"
        #render "new"   
else 
    redirect_to '/users/auth/google_oauth2'
end 
end
def edit_google_calendar_alert
 event = Event.find_by_id(params[:id])
     @user = current_user 
   @push = SetAlert.where(:event_id => event.id, :user_id => @user.id).first 
   redirect_to @push.gcpush_htmllink

end
def remove_google_calendar_alert
      event = Event.find_by_id(params[:id])
      @user = current_user
      @gauth = @user.authorizations.where(provider: 'google_oauth2').first_or_initialize
      @push = SetAlert.where(:event_id => event.id, :user_id => @user.id).first 
           
      client = Google::APIClient.new
      client.authorization.client_id = ENV['GOOGLE_KEY']
      client.authorization.client_secret = ENV['GOOGLE_SECRET']      
      if Time.now < @gauth.updated_at + 3600
        client.authorization.access_token = @gauth.token
      else
      
      client.authorization.access_token = @gauth.token
      client.authorization.refresh_token = @gauth.secret
      client.authorization.fetch_access_token!
      @gauth.token = client.authorization.access_token
      @gauth.save!
      end
      service = client.discovered_api('calendar', 'v3')                        
      @result = client.execute(
    :api_method => service.events.delete,
    :parameters => {'calendarId' => 'primary','eventId' => @push.gcpush_id}) 
   # Rails.logger.info @result
    @push.gcpush_id = nil
    @push.gcpush_htmllink = nil
    @push.save!
    redirect_to root_path, notice: "Event: #{event.title}<----> Successfully deleted from Google Calendar"  
    
  
end
end
