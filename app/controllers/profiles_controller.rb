class ProfilesController < ApplicationController
		before_action :find_profile, only: [:show, :edit, :update, :destroy]
  def index
  end

  def new
  	@profile = Profile.new
  end
  
  def create
  	@profile = current_user.build_profile(profile_params)
  	redirect_to root_path if @profile.save
  end

  def show
  	
  end

  def edit
  end

  def update
  	redirect_to profile_path(@profile.id) if @profile.update(profile_params)
  end
  def destroy
  	@profile.destroy 
  	redirect_to root_path
  end

  private
def profile_params
	params.require(:profile).permit(:user_id, :nickname, :age, :avatar)
end
def find_profile
	@profile = Profile.find_by(params[:id])
end
end
end
