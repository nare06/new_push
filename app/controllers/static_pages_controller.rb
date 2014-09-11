class StaticPagesController < ApplicationController
  
  def home
  
    @campus =  Campus.new
    @campuses = Campus.all 
    #@title = "Home"
    @categories = Category.all
    @domains = Domain.all
    #redirect_to current_user.campus if signed_in? && current_user.campus
  end
  
  def new_events
  t = Time.at(params[:created_at].to_i)
     @events = Event.where("updated_at > ?",Time.at(params[:created_at].to_i))
     @user = current_user || User.new
     respond_to do |format|
        format.js
     end
  end
  
  def about
   # @title = "About"
  end
  
  def contact
   # @title = "Contact"
  end
  
  def help
   # @title = "Help"
  end
  
  def faq  
  end
  def tour
  end
  def our_works
  end
  def team
  end
  def partnerships
  end
  def show
     @events = Event.all.reverse
     respond_to do |format|
     format.js
     end
     end
   def launch
     redirect_to demo_path
     @user = User.new
     #render :layout => false 
    
   end
      
end
