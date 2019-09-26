class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_profile, only: [:update, :edit]

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 10, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    # TODO
    # get user from current_user
    # Ensure that we have the user who is filling out form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :new
    end
  end

  def edit
    if !current_user.profile && current_user.profile.id != params[:id].to_i
      redirect_to root_path
    end
  end

  def update
    @user = User.find( params[:user_id] )
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :edit
    end
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(
        :restaurant_name,
        :address,
        :raw_address,
        :street,
        :avatar,
        :longitude,
        :latitude,
        :city,
        :state,
        :zipcode,
        :cuisine,
        :website,
        :hours,
        :phone_number
      )
    end
end
