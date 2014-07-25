class StaticPagesController < ApplicationController
  def home
  
  @campus = Campus.new
    #@title = "Home"
    @categories = Category.all
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
     render :layout => false 
   end
      
end
