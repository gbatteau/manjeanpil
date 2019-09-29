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
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to root_path
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
    if current_user.profile && current_user.profile.id == params[:id].to_i
      if @profile.update(profile_params)
        flash[:success] = "Profile updated!"
        redirect_to root_path
      else
        render action: :edit
      end
    else
      redirect_to root_path
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
