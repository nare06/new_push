class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
def index
  @campus = Campus.friendly.find(params[:campus_id])
  @events = Event.all    # in campus
   @groups = Group.all    # in campus
end
def show
 @campus = Campus.friendly.find(params[:campus_id])
  @group = Group.friendly.find(params[:id])
  @events = @group.events
   @user = current_user || User.new
end
def new

#@campus= Campus.friendly.find(params[:campus_id])
  @group = Group.new
#@group.campus_id = @campus.id
end
def edit
end
def create
    @group = Group.new(group_params)         
       respond_to do |format|
      if @group.save
            
     # debugger
        format.html { redirect_to @group, notice: 'Group Created' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end      
 end
 def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :slug, :description, :short_name, 
      :campus,:contact_name, :contact_phone, :email, :domain_ids => [])
    end
end
