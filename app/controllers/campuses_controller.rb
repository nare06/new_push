class CampusesController < ApplicationController
	before_action :set_campus, only: [:show, :edit, :update, :destroy]
def new
@campus = Campus.new
end
def edit
end
def show
		@campus = Campus.friendly.find(params[:id])
		@campus_events = @campus.events        
		@reach = Reach.all
    @events = @campus_events.approved.upcoming.latest || Event.new
		@event_reach1   = @campus_events.approved.upcoming.where("reach_id = ?",1).latest     
		@event_reach2   = @campus_events.approved.upcoming.where("reach_id = ?",2).latest 
		@trending   = @campus_events.approved.upcoming.latest
		#@events = Event.all.paginate(:page => params[:page], :per_page => 7)
    @campus_groups  = @campus.groups
    @user = User.new
		if user_signed_in? 
			@user = User.find(current_user.id)
			@auth = @user.authorizations
			@cat_array  = @user.categories #.collect{|p| p.id}
			@dom_array   = @user.domains
			@eli_array  = @user.eligibles
		
			@categor =[]
			@domai = []
			@eligibl = []
				 
			@cat_array.each do |u|    
						@cat = Category.find(u.id)
						@categor = @categor << @cat.events.approved.upcoming.pluck(:id)       
				end
			@dom_array.each do |u|    
						@dom = Domain.find(u.id)
						@domai = @domai << @dom.events.approved.upcoming.pluck(:id)  
					 end    
			@eli_array.each do |u|    
						@eli = Eligible.find(u.id)
						@eligibl = @eligibl << @eli.events.approved.upcoming.pluck(:id) 
					end    

				@events_array = @categor.flatten << @eligibl.flatten << @domai.flatten
				ids = @events_array.flatten
				sorted_ids = ids.sort_by{|id| ids.select{|id2| id2 == id}.size}.reverse.uniq				
        records = Event.find(sorted_ids).group_by(&:id)
        @myevents = sorted_ids.map { |id| records[id].first }
				@favorites = @user.userfavorites.upcoming
				@attending = @user.usershares.upcoming
				@tab7 = @user.events.approved.upcoming
              
        end
end
# POST /campus
	# POST /campus.json
	def create
		@campus = Campus.new(campus_params)

		respond_to do |format|
			if @campus.save
				format.html { redirect_to @campus, notice: 'Campus was successfully created.' }
				format.json { render action: 'show', status: :created, location: @campus }
			else
				format.html { render action: 'new' }
				format.json { render json: @campus.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /campus/1
	# PATCH/PUT /campus/1.json
	def update
		respond_to do |format|
			if @campus.update(campus_params)
				format.html { redirect_to @campus, notice: 'Campus was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @campus.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /campus/1
	# DELETE /campus/1.json
	def destroy
		@campus.destroy
		respond_to do |format|
			format.html { redirect_to campus_url }
			format.json { head :no_content }
		end
	end
def index
@campuses = Campus.all
@events = Event.approved.latest.upcoming
end
private
		def set_campus
			@campus = Campus.friendly.find(params[:id])
		end

def campus_params
			params.require(:campus).permit(:name, :short_name, :slug)
		end
end
