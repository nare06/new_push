class RefreshController < ApplicationController
before_action :authenticate_user!, only: :myevents
def index
    @cat = []
    @dom = []
    @eli = []
    @cat = [params[:category_ids]].flatten.reject(&:blank?) if params[:category_ids]
    @dom = [params[:domain_ids]].flatten.reject(&:blank?)   if params[:domain_ids]
    @eli = [params[:eligible_ids]].flatten.reject(&:blank?) if params[:eligible_ids]
    @cat_items= Category.find(@cat)
    @dom_items= Domain.find(@dom)
    @eli_items= Eligible.find(@eli)
    ids =[@cat_items, @dom_items, @eli_items].flatten.reject(&:blank?).collect(&:event_ids).flatten 
#@cat = Category.find(params[:category][:category_id]) if params[:category][:category_id].present?
 # @dom = Domain.find(params[:domain][:domain_id]) if params[:domain][:domain_id].present?
 # @eli = Eligible.find(params[:eligible][:eligible_id]) if params[:eligible][:eligible_id].present?
  #ids = [@cat, @dom, @eli].reject(&:blank?).collect(&:event_ids).flatten
    sorted_ids = ids.sort_by{|id| ids.select{|id2| id2 == id}.size}.reverse.uniq
    records = Event.find(sorted_ids).group_by(&:id)
    @all = sorted_ids.map { |id| records[id].first }
    @user = current_user || User.new  

#@event_ids || @events.collect{|p| p.id}
#@event_ids = id_array.collect{|id| id.to_i}

end
def by_date
date = params[:date]
num = params[:num]
week = params[:week]
@user = current_user || User.new
if date.present?
    time = Date.new(date["year"].to_i,date["month"].to_i,date["day"].to_i)
    @all = Event.approved.upcoming.latest.where("sdatetime > ? and sdatetime < ?", time.beginning_of_day, time.end_of_day)
    render "index"
    elsif num.present?    
     @all = Event.approved.upcoming.latest.where("sdatetime > ? and sdatetime < ?", Time.now.beginning_of_day, Time.now.end_of_day + num.to_i.days)
     render "index"
     elsif week.present?
       @all = Event.approved.upcoming.latest.where("sdatetime > ? and sdatetime < ?", Time.now.beginning_of_week, Time.now.end_of_week)
       render "index"
     else
     @all = Event.approved.upcoming.latest.where("sdatetime > ? and sdatetime < ?", Time.now.beginning_of_month, Time.now.end_of_month)
     render "index"
     end
end

def myevents
    @user = current_user || User.new
    @cat_array  = [@user].collect(&:category_ids).flatten
    @dom_array   = [@user].collect(&:domain_ids).flatten
    @eli_array  = [@user].collect(&:eligible_ids).flatten
    
    @categor =[]
    @domai = []
    @eligibl = []
    @cat = [Category.find(@cat_array)].flatten.collect(&:event_ids)
    @dom = [Domain.find(@dom_array)].flatten.collect(&:event_ids)
    @eli = [Eligible.find(@eli_array)].flatten.collect(&:event_ids)
=begin
    @cat_array.each do |u|    
            @ca = Category.find(u.id)
            @categor = @categor << @ca.events.collect{|p| p.id}       
        end
 
     @dom_array.each do |u|    
            @do = Domain.find(u.id)
            @domai = @domai << @do.events.collect{|p| p.id}
   
           end
        
      @eli_array.each do |u|    
            @el = Eligible.find(u.id)
            @eligibl = @eligibl << @el.events.collect{|p| p.id}
              end
         @events_array = @categor.flatten << @eligibl.flatten << @domai.flatten
=end
    ids = [@cat, @dom, @eli].flatten         
    sorted_ids = ids.sort_by{|id| ids.select{|id2| id2 == id}.size}.reverse.uniq
         records = Event.find(sorted_ids).group_by(&:id)
         @all = sorted_ids.map { |id| records[id].first }
    render "index"
end
def hallevents
    @user = current_user || User.new
    @all = Event.approved.upcoming.latest.where("reach_id = ?",2)     
    render "index"
end
def campusevents
    @user = current_user || User.new
    @all   = Event.approved.upcoming.latest.where("reach_id = ?",1)
    render "index"
end
def search
@user = current_user || User.new
@search = params[:search]
@all = Event.approved.upcoming.latest.search "#{@search}"
render "index"
end
end

