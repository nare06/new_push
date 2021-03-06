class MicropostsController < ApplicationController

def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      render current_user
    end
end
def destroy
end

private

def micropost_params
  params.require(:micropost).permit(:content)
end
end
